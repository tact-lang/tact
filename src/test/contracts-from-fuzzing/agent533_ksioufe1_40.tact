struct Inner {
  i: Int;
}

struct WithOptional {
  nested: Inner?;
}

contract OptNest {
  s: WithOptional;
  init() {
    self.s = WithOptional{
      nested: null
    };
  }
}