struct BoolChain3 {
  b1: Bool;
}

struct BoolChain2 {
  sub: BoolChain3;
  b2: Bool;
}

struct BoolChain1 {
  root: Bool;
  chain: BoolChain2;
}

contract NestedBoolFields {
  field: BoolChain1;

  init() {
    self.field = BoolChain1{
      root: true,
      chain: BoolChain2{
        sub: BoolChain3{
          b1: false,
        },
        b2: true,
      },
    };
  }
}