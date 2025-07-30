struct SOpt {
  a: Int?;
  b: Bool?;
}

struct SNestOpt {
  s: SOpt?;
}

contract DeepOptOptional {
  data: SNestOpt;
  init() {
    self.data = SNestOpt{
      s: null
    };
  }
}