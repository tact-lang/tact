struct NestedManyOptionals {
  a: Int?;
  nested1: OptSet1;
}

struct OptSet1 {
  b: Int?;
  nested2: OptSet2;
}

struct OptSet2 {
  c: Int?;
  nested3: OptSet3;
}

struct OptSet3 {
  d: Int?;
}

contract DeepOptChain {
  s: NestedManyOptionals;

  init() {
    self.s = NestedManyOptionals{
      a: null,
      nested1: OptSet1{
        b: null,
        nested2: OptSet2{
          c: null,
          nested3: OptSet3{ d:null }
        }
      }
    };
  }
}
