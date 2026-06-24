struct OptionEarly {
  val: Int?;
  next: ChainS;
}

struct ChainS {
  x: Int;
  y: Bool;
}

contract OptionFirst {
  d: OptionEarly;

  init() {
    self.d = OptionEarly{
      val: null,
      next: ChainS{x:5,y:true}
    };
  }
}