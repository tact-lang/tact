struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Bool;
}

struct Outer {
  s1: Inner1;
  s2: Inner2;
  opt: Int?;
}

contract ComplexNested {
  data: Outer = Outer{
    s1: Inner1{ a: 5 },
    s2: Inner2{ b: true },
    opt: null,
  };
}