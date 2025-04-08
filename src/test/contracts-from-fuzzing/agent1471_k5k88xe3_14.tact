struct InnerOne {
  val: Int;
}

struct OuterOne {
  nested1: InnerOne;
  nested2: InnerOne;
}

contract NestedRepeatedStructs {
  storage: OuterOne;

  init() {
    self.storage = OuterOne{
      nested1: InnerOne{ val: 1 },
      nested2: InnerOne{ val: 2 },
    };
  }
}