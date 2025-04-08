struct SDefaultNested {
  foo: Int = 7;
  nested: SNested;
}

struct SNested {
  bar: Int = 8;
}

contract TestContract {
  val: SDefaultNested;
  init() {
    self.val = SDefaultNested{
      nested: SNested{}
    };
  }
}