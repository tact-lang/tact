// deeply nested with optionals and defaults
struct InnerMost {
  x: Int? = null;
  y: Bool;
}
struct Mid {
  im: InnerMost;
}
struct Outer {
  mid: Mid;
}

contract DefaultNested {
  o: Outer = Outer{mid: Mid{im: InnerMost{x:null,y:true}}};
  init() {}
}