import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:deneme_2/sonuc_sayfasi_page.dart';

class ProfilSayfasiPage extends StatefulWidget {
  const ProfilSayfasiPage({super.key});

  @override
  ProfilSayfasiPagestate createState() => ProfilSayfasiPagestate();
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}

class ProfilSayfasiPagestate extends State<ProfilSayfasiPage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _profiles = ['Profil 1', 'Profil 2', 'Profil 3'];
  final List<String> _diseaseOptions = ['Yok', 'Var'];
  final List<String> _physicalOptions = ['Bel Fıtığı', 'Boyun Fıtığı', 'Karpal Tünel Sendromu'];
  final List<String> _psychologicalOptions = ['Depresyon', 'Panik Atak', 'Anksiyete', 'Dehp', 'Otizm'];
  final MultiSelectController<User> _controller = MultiSelectController();

  String? _selectedProfile;
  String? _selectedAge;
  String? _selectedHeight;
  String? _selectedWeight;
  String? _selectedDisease;
  String? _selectedPhysicalDisease;
  String? _selectedPsychologicalDisease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Ekran Süresi Hesaplama',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedProfile,
                    hint: const Text('Profil Seçimi'),
                    items: _profiles.map((profile) {
                      return DropdownMenuItem(
                        value: profile,
                        child: Text(profile),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProfile = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedAge,
                    hint: const Text('Yaşınız'),
                    items: List.generate(100, (index) {
                      return DropdownMenuItem(
                        value: index.toString(),
                        child: Text(index.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAge = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Boyunuz',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _selectedHeight = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen boyunuzu giriniz';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Kilonuz',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _selectedWeight = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen kilonuzu giriniz';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedDisease,
                    hint: const Text('Herhangi bir hastalığınız var mı'),
                    items: _diseaseOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MultiSelectDropDown<User>(
                    controller: _controller,
                    clearIcon: const Icon(Icons.reddit),
                    onOptionSelected: (options) {
                      setState(() {
                        // Do something with the selected options
                      });
                    },
                    options: <ValueItem<User>>[
                      ValueItem(label: 'Miyop', value: User(name: 'User 1', id: 1)),
                      ValueItem(label: 'Hipermetrop', value: User(name: 'User 2', id: 2)),
                      ValueItem(label: 'Astigmat', value: User(name: 'User 3', id: 3)),
                      ValueItem(label: 'Şaşılık', value: User(name: 'User 4', id: 4)),
                      ValueItem(label: 'Option 5', value: User(name: 'User 5', id: 5)),
                    ],
                    maxItems: 4,
                    singleSelectItemStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    chipConfig: const ChipConfig(wrapType: WrapType.wrap, backgroundColor: Colors.red),
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(
                      Icons.check_circle,
                      color: Colors.pink,
                    ),
                    selectedOptionBackgroundColor: Colors.grey.shade300,
                    selectedOptionTextColor: Colors.blue,
                    dropdownMargin: 2,
                    onOptionRemoved: (index, option) {},
                    optionBuilder: (context, valueItem, isSelected) {
                      return ListTile(
                        title: Text(valueItem.label),
                        subtitle: Text(valueItem.value.toString()),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle)
                            : const Icon(Icons.radio_button_unchecked),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedPhysicalDisease,
                    hint: const Text('Fiziksel Hastalıklar'),
                    items: _physicalOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPhysicalDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedPsychologicalDisease,
                    hint: const Text('Psikoloji Hastalıkları'),
                    items: _psychologicalOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPsychologicalDisease = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Kaydet-Güncelle işlemleri burada gerçekleştirilecek
                        print('Profil Seçimi: $_selectedProfile');
                        print('Yaşınız: $_selectedAge');
                        print('Boyunuz: $_selectedHeight');
                        print('Kilonuz: $_selectedWeight');
                        print('Herhangi bir hastalığınız var mı: $_selectedDisease');
                        print('Fiziksel Hastalıklar: $_selectedPhysicalDisease');
                        print('Psikoloji Hastalıkları: $_selectedPsychologicalDisease');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Kaydet-Güncelle'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SonucSayfasiPage()),
                      ); // Uygulamayı Başlat işlemi burada gerçekleştirilecek
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Uygulamayı Başlat'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}