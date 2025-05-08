struct NestedChain1 {
  next: NestedChain2;
}

struct NestedChain2 {
  next: NestedChain3;
}

struct NestedChain3 {
  val: Int;
}

contract ChainStructs {
  data: NestedChain1;

  init() {
    self.data = NestedChain1{
      next: NestedChain2{
        next: NestedChain3{
          val: 999
        }
      }
    };
  }
}