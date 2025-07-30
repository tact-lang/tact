struct Child {
  a: Int?;
}

struct Parent {
  childOpt: Child?;
}

contract OptionalStructHasOptionalFields {
  val: Parent = Parent{
    childOpt: null,
  };

  receive() {
    self.val = self.val;
  }
}