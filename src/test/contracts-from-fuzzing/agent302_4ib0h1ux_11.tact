struct Rec {
  inner: Int?;
}

struct OuterOpt {
  data: Rec?;
}

contract OptNestedOpt {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{
      data: null
    };
  }
}