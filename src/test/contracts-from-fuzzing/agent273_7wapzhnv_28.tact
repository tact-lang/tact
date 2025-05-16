struct BoolOptNest {
  opt: Bool?;
  nested: BoolOptInner;
}

struct BoolOptInner {
  opt2: Bool?;
  plain: Bool;
}

contract TestContract {
  bon: BoolOptNest;

  init() {
    self.bon = BoolOptNest{
      opt: true,
      nested: BoolOptInner{
        opt2:null,
        plain:false
      }
    };
  }
}