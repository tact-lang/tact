struct PrimNested {
  x: Int;
}

struct Wrapper {
  inner: PrimNested;
}

struct TopLevel {
  wrap: Wrapper;
}

contract NestedPrimitive {
  f: TopLevel;
  init() {
    self.f = TopLevel{
      wrap: Wrapper{inner: PrimNested{x:42}}
    };
  }
}