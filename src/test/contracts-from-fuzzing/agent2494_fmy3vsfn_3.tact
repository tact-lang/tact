struct Inner {
  flag: Bool = false;
  num: Int?; // optional with default null
}

struct Outer {
  a: Inner;
  b: Int = 5;
  c: Bool?; // implicitly null
}

contract OptionalNested {
  data: Outer = Outer{
    a: Inner{flag: true, num: 7},
    b: 10,
    c: true,
  };
}