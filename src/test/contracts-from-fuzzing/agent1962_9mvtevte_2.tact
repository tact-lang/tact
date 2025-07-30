struct Inner {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
}

struct Outer {
  nested: Inner;
  optNested: Inner?;
}

contract Storage {
  data1: Inner;
  data2: Outer;

  init() {
    self.data1 = Inner{a:1, b:true, c:"x", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice()};
    self.data2 = Outer{
      nested: self.data1,
      optNested: self.data1,
    };
  }
}