class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final String image;
  User({
    required this.image,
    required this.gender,
    required this.phone,
    required this.email,
    required this.cell,
    required this.nat,
  });
}

class UserName {
  final title;
  final frist;
  final last;

  UserName({
    required this.frist,
    required this.last,
    required this.title,
  });
}
