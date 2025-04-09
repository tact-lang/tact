struct Mid {
  x: Int;
  y: Bool;
}

struct Outer {
  p: Mid;
  q: Mid;
  r: Mid;
}

contract MultiLevel {
  stuff: Outer = Outer{
    p: Mid{ x:1, y:true },
    q: Mid{ x:2, y:false },
    r: Mid{ x:3, y:true }
  };
}