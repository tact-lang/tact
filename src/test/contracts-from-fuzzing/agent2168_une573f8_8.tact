struct Inner {
  x: Int;
  y: Int?;
}

struct Middle {
  in1: Inner;
  in2: Inner;
}

struct Outer {
  mid: Middle;
  flag: Bool;
}

contract NestedStructDefault {
  content: Outer = Outer{
    mid: Middle{
      in1: Inner{ x: 1, y: null },
      in2: Inner{ x: 2, y: 3 }
    },
    flag: true
  };
}