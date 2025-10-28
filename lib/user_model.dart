class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });


// factory constructor untuk membuat objek user dari JSON map.
// ini akan digunakan saat kita menerima data dari API
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
  
}