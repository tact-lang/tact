struct NestedBoolOpt {
  b1: Bool?;
  b2: Bool?;
}

struct OuterBoolOpt {
  inner: NestedBoolOpt;
}

contract NestedOptBoolFields {
  x: OuterBoolOpt;

  init() {
    self.x = OuterBoolOpt{inner: NestedBoolOpt{b1:true,b2:null}};
  }
}