struct Profile {
  name: String?;
  bio: String?;
}

struct User {
  profile: Profile?;
  nickname: String?;
}

contract OptionalStrings {
  user: User;

  init() {
    self.user = User {
      profile: null,
      nickname: null
    };
  }
}