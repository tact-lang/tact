struct DeepNested {
  a: Int = 1;
  b: Bool = false;
}

struct Middle {
  d1: DeepNested;
  d2: DeepNested;
  note: String = "middle";
}

struct Top {
  m1: Middle;
  m2: Middle;
  comment: String = "top";
}

contract DeepNestedTest {
  all: Top = Top{
    m1: Middle{
      d1: DeepNested{a:2,b:true},
      d2: DeepNested{a:3,b:false},
      note:"m1"
    },
    m2: Middle{
      d1: DeepNested{a:4,b:true},
      d2: DeepNested{a:5,b:false},
      note: "m2"
    },
    comment: "ok"
  };
  init() {}
}