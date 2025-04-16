struct DeeplyNested {
  a: Int;
}

struct Middle1 {
  d: DeeplyNested;
}

struct Middle2 {
  d: DeeplyNested;
}

struct Container {
  m1: Middle1;
  m2: Middle2;
}

contract SisterNests {
  val: Container;

  init() {
    self.val = Container{
      m1: Middle1{d: DeeplyNested{a:1}},
      m2: Middle2{d: DeeplyNested{a:2}}
    };
  }
}