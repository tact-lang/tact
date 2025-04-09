struct Inner {
  val: Int = 99;
}

struct Outer {
  part: Inner? = null;
  other: Int;
}

contract OptionalDefaultedNestedStruct {
  persist: Outer;

  init() {
    self.persist = Outer{
      other: 123
    };
  }
}