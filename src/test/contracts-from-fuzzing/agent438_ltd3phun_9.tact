struct IntsAndBools {
  a: Int;
  b: Bool;
}

struct Container {
  fa: IntsAndBools;
  fb: IntsAndBools;
  fc: IntsAndBools;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      fa: IntsAndBools{ a:1, b:true },
      fb: IntsAndBools{ a:2, b:false },
      fc: IntsAndBools{ a:3, b:true },
    };
  }
}