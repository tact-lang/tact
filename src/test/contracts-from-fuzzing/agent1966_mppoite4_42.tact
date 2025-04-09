struct InnerOptional {
  b: Bool?;
}

struct OuterOptional {
  st: InnerOptional?;
}

contract OptionalsInOptionals {
  data: OuterOptional;

  init() {
    self.data = OuterOptional{
      st: InnerOptional{
        b: null
      }
    };
  }
}
