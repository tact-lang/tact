struct StringAndAddress {
  s: String;
  a: Address;
}

struct BoolIntOpt {
  b: Bool;
  i: Int?;
}

contract TestContract {
  f1: StringAndAddress;
  f2: BoolIntOpt;

  init() {
    self.f1 = StringAndAddress{ s:"X", a:myAddress() };
    self.f2 = BoolIntOpt{ b:true, i:null };
  }
}