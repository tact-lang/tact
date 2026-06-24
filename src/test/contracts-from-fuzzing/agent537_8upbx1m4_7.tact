struct InnerMost {
  z: Int;
}

struct Inner {
  y: Int;
  im: InnerMost;
}

contract Test {
  nested: Inner = Inner{
    y: 1,
    im: InnerMost{z: 2}
  };
}
