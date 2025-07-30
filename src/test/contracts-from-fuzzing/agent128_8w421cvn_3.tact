struct InnerMost {
  z: Int?;
}

struct Inner {
  y: InnerMost?;
}

contract TestContract {
  x: Inner = Inner{ y: null };
}