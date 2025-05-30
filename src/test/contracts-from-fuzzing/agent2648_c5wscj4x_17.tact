struct NestedOpt {
  a: Int;
  b: String?;
}

struct Container {
  one: NestedOpt?;
  two: NestedOpt?;
}

contract MultiNulls {
  val: Container;

  init() {
    self.val = Container{ one:null, two:null };
  }
}
