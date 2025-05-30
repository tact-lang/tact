struct SubStruct {
  a: Int;
  b: Int?;
}

struct NestedStruct {
  sub: SubStruct;
  c: Bool;
}

contract TestContract {
  nested: NestedStruct;

  init() {
    self.nested = NestedStruct{
      sub: SubStruct{a:1, b:null},
      c: true
    };
  }
}