class User {
  String nama;
  String password;

  User({
    required this.nama,
    required this.password,
  });
}

List<User> dataUser = [
  User(
    nama: "Adi",
    password: "026",
  ),
  User(
    nama: "Andika",
    password: "033",
  ),
  User(
    nama: "Imam",
    password: "018",
  ),
  User(
    nama: "Aril",
    password: "027",
  ),
];