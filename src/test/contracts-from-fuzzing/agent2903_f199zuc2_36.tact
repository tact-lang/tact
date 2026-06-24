struct InnerS {
  z: Int;
}

struct OuterS {
  inner: InnerS?;
}

contract MultiLayerOpt(
  s: OuterS?
) {}