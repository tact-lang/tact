struct Defaults {
  count: Int = 0;
  name: String = "default";
  flag: Bool = false;
}

contract DefaultStruct {
  item: Defaults;

  init() {
    self.item = Defaults{};
  }
}
