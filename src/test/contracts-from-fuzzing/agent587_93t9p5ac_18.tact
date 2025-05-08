struct NestedWithDefaults {
  x: Int = 5;
  child: ChildStruct;
}

struct ChildStruct {
  a: Int = 1;
  b: Bool?;
}

contract NestedDefaultsContract {
  state: NestedWithDefaults;

  init() {
    self.state = NestedWithDefaults{
      child: ChildStruct{
        b: null
      }
    };
  }
}