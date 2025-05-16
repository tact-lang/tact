struct UserData {
  username: String?;
  email: String? = null;
  active: Bool = false;
}

contract TestContract {
  user: UserData;

  init() {
    self.user = UserData{};
  }
}