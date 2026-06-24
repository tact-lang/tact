struct Inner {
  f: Bool?;
}

struct Outer {
  inner: Inner?;
}

contract OptChain {
  o: Outer = Outer{
    inner: null
  };
}