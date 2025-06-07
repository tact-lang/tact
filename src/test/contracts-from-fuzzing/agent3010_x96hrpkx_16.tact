struct EmbedBool {
  flag: Bool;
}

struct EmbedInt {
  count: Int;
}

struct EmbedAddr {
  addr: Address;
}

contract FieldCombo {
  f1: EmbedBool;
  f2: EmbedInt;
  f3: EmbedAddr;

  init() {
    self.f1 = EmbedBool{ flag: true };
    self.f2 = EmbedInt{ count: 55 };
    self.f3 = EmbedAddr{ addr: myAddress() };
  }
}