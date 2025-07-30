struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: String;
}

struct Mixed {
  s1: Inner1;
  s2: Inner2;
}

contract StructsWithStructs {
  field: Mixed;

  init() {
    self.field = Mixed{
      s1: Inner1{a:42},
      s2: Inner2{b:"hi"}
    };
  }
}