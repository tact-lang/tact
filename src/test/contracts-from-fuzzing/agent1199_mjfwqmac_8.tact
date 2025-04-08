struct Outer {
  nested1: S1;
  nested2: Wrapper;
}

struct S1 {
  num: Int;
}

struct Wrapper {
  val: Int;
  sub: InnerOpt;
}

struct InnerOpt {
  i: Int?;
  s: String?;
}

contract Test8 {
  field: Outer;

  init() {
    self.field = Outer{
      nested1: S1{num: 123},
      nested2: Wrapper{
        val: 7,
        sub: InnerOpt{i:null, s:null}
      }
    };
  }
}