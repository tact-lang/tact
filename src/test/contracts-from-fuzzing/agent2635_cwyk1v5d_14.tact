struct OptionalInner {
  x: Int?;
}

struct ComposeOpt {
  a: Int;
  b: OptionalInner?;
}

contract ComplexOpt {
  val: ComposeOpt;

  init(){
    self.val = ComposeOpt{
      a: 5,
      b: null
    };
  }
}