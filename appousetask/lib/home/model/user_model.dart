class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
        name: 'ZMC',
        imageUrl: 'https://avatars.githubusercontent.com/u/83475074?v=4');
  }
}
