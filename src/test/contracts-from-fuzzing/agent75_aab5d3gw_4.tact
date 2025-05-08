struct User {
  id: Int;
  nickname: String;
  email: String?;
  verified: Bool;
}

contract Test {
  currentUser: User;

  init() {
    self.currentUser = User{
      id: 1,
      nickname: "Alice",
      email: null,
      verified: false
    };
  }
}