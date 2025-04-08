struct User {
  name: String;
  age: Int?;
}

struct AccountInfo {
  balance: Int;
  owner: User?;
}

contract Test21 {
  user: User?;
  info: AccountInfo?;

  init() {
    self.user = null;
    self.info = null;
  }
}
