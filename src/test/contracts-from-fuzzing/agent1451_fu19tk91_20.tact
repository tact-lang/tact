struct OneOf {
  i: Int?;
  s: String?;
  b: Bool?;
}

contract EnumLike {
  val: OneOf = OneOf{
    i: null,
    s: "hi",
    b: null,
  };

  receive() {
    self.val = self.val;
  }
}