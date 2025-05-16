struct MultiOpt {
  b: Bool?;
  i: Int?;
  s: String?;
}

contract ManyOptionals {
  val: MultiOpt;
  init() {
    self.val = MultiOpt{
      b: null,
      i: null,
      s: null
    };
  }
}