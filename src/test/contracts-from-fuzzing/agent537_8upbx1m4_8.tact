struct InnerMost {
  z: Int;
}

struct Inner {
  y: Int;
  im: InnerMost?;
}

contract Test {
  nested: Inner = Inner{
    y: 5,
    im: null
  };
}
