// struct nesting optionals within optionals is disallowed (nested optional known issue)
// instead, combine optional struct with optional subfield

struct Sub {
  num: Int?;
}

struct Container {
  subOpt: Sub?;
  num2: Int;
}

contract OptNested {
  store: Container;

  init() {
    self.store = Container{
      subOpt: null,
      num2: 77
    };
  }
}