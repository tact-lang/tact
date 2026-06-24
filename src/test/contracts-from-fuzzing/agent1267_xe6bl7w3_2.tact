struct Inside {
  inner: Int;
  optionalInner: Bool?;
}

struct Outside {
  nested: Inside;
  x: Int;
  y: Bool?;
}

contract DeepOptional {
  val: Outside;
  
  init() {
    self.val = Outside{
      nested: Inside{ inner: 42, optionalInner: null },
      x: 7,
      y: true
    };
  }
}
