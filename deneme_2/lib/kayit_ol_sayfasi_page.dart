// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailController = TextEditingController();
  bool _acceptKvkk = false;
  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate() && _acceptKvkk) {
      // Kayıt işlemleri burada gerçekleştirilecek
      print('Kullanıcı Adı: ${_usernameController.text}');
      print('Şifre: ${_passwordController.text}');
      print('Şifre Tekrar: ${_passwordConfirmController.text}');
      print('E-posta: ${_emailController.text}');
    } else if (!_acceptKvkk) {
      // KVKK onayı alınmamışsa uyarı gösterilebilir
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen KVKK onayini kabul ediniz.')),
      );
    }
  }

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
                const Icon(
                  Icons.people,
                  size: 100,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                
               
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Kullanici adi',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kullanıcı adınızı giriniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextPassword = !_obscureTextPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureTextPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi giriniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                    labelText: 'Şifre Tekrar',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextPasswordConfirm ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextPasswordConfirm = !_obscureTextPasswordConfirm;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureTextPasswordConfirm,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi tekrar giriniz';
                    }
                    if (value != _passwordController.text) {
                      return 'Şifreler eşleşmiyor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-posta',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-posta adresinizi giriniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptKvkk,
                      onChanged: (value) {
                        setState(() {
                          _acceptKvkk = value!;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text(
                        'Kvkk okudum, anladım.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Kayıt Ol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}