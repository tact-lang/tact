struct AddressS {
  addr: Address;
}

struct StringS {
  txt: String;
}

struct BoolS {
  b: Bool;
}

contract TestContract {
  sa: AddressS;
  ss: StringS;
  sb: BoolS;

  init() {
    self.sa = AddressS{ addr: myAddress() };
    self.ss = StringS{ txt: "X" };
    self.sb = BoolS{ b: true };
  }
}