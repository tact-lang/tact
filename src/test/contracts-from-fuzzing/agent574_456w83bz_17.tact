// nested optional struct inside struct, persistent
struct DeepOpt {
  inner: Int?;
}

struct Cont {
  nested: DeepOpt?;
}

contract OptionalStructInside {
  cont: Cont;

  init() {
    self.cont = Cont{ nested: null };
  }
}