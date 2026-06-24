struct HasDefaults {
 a: Int = 42;
 b: Bool = true;
 c: String = "abc";
}

contract DefaultsInStructStorage {
  data: HasDefaults;

  init() {
    self.data = HasDefaults{};
  }
}