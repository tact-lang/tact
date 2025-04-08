struct Deep {
  inner: Inner;
  flag: Bool;
}

struct Inner {
  x: Int;
  opt: Int?;
}

contract C {
  d: Deep = Deep{ inner: Inner{ x: 5, opt: null }, flag: true };
}