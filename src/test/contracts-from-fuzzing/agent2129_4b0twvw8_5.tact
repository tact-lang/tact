struct BigNested {
  x1: Int;
  x2: Int;
  str: String;
  b: Bool;
}

struct Outer {
  n1: BigNested;
  n2: BigNested;
  n3: BigNested;
}

contract MultiNested {
  data: Outer;

  init() {
    self.data = Outer{
      n1: BigNested{ x1:1, x2:2, str:"s", b:true },
      n2: BigNested{ x1:3, x2:4, str:"t", b:false },
      n3: BigNested{ x1:5, x2:6, str:"u", b:true },
    };
  }
}