struct Siblings {
  alpha: Int?;
  beta: Int?;
  gamma: Int?;
  delta: Int?;
}

struct Parent {
  left: Siblings;
  right: Siblings;
}

contract OptionalSiblings {
  nested: Parent;

  init() {
    self.nested = Parent{
      left: Siblings{alpha:null,beta:2,gamma:null,delta:4},
      right: Siblings{alpha:5,beta:null,gamma:7,delta:null}
    };
  }
}