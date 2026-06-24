struct Mixed {
  a: Int;
  b: Bool;
  c: String;
}

struct TwoMixed {
  first: Mixed;
  second: Mixed;
}

contract MultiNest {
  nested: TwoMixed;
  init() {
    self.nested = TwoMixed{
      first: Mixed{a:1,b:true,c:"x"},
      second: Mixed{a:2,b:false,c:"y"}
    };
  }
}