struct NestedDefault {
  child: ChildStruct;
}

struct ChildStruct {
  a: Int = 1;
  b: Bool = false;
  c: String = "c";
  d: Int?; // default null
}

contract NestedDefaultTest {
  s: NestedDefault;
  init() {
    self.s = NestedDefault{
      child: ChildStruct{
        d: null,
      }
    };
  }
}
