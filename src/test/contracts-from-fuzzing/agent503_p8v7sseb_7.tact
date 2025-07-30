struct Sub {
  a: Int = 11;
  b: Bool = false;
}

contract DefaultsCombo {
  sub: Sub = Sub{};

  init() {
    self.sub = Sub{ a: 77 };
  }
}
