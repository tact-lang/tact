struct User {
  name: String;
  verified: Bool;
}

struct Account {
  id: Int;
  owner: User;
}

struct Config {
  key: String;
  value: String?;
}

contract ManyStructs {
  first: User;
  second: Account;
  third: Config;

  init() {
    self.first = User{name: "anon", verified: false};
    self.second = Account{id: 0, owner: self.first};
    self.third = Config{key: "mode", value: null};
  }
}
