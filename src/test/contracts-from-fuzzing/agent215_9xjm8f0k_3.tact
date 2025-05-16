struct S {
  x: Int;
  y: Bool;
}

struct Outer {
  inner1: S;
  inner2: S;
  flag: Bool;
}

contract DeepNested {
  data: Outer = Outer{
    inner1: S{x: 1, y: true},
    inner2: S{x: 2, y: false},
    flag: true
  };
}