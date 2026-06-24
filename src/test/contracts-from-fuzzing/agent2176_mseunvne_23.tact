struct Combo {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Int?;
  f: String?;
}

contract ComboFields {
  f1: Combo;
  f2: Combo;

  init() {
    self.f1 = Combo{ a:1, b:true, c:"c", d:myAddress(), e:null, f:null };
    self.f2 = Combo{ a:42, b:false, c:"cc", d:myAddress(), e:7, f:"f" };
  }
}
