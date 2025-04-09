struct Leaf {
  val: Int;
}

struct Mid {
  leafOpt: Leaf?;
}

struct Root {
  mid: Mid;
}

contract OptNestedStructs {
  data: Root;

  init() {
    self.data = Root{
      mid: Mid{
        leafOpt: null
      }
    };
  }
}
