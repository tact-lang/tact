// Contract with nested structs containing optional structs
struct Deepest {
  val: Int;
}

struct MiddleOpt {
  d: Deepest?;
}

struct TopOpt {
  m: MiddleOpt?;
}

contract OptStructInStruct {
  s: TopOpt;

  init() {
    self.s = TopOpt{
      m: MiddleOpt{
        d: Deepest{val: 42}
      }
    };
  }
}