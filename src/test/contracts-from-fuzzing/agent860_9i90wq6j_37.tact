struct Imm {
  a: Int;
}
contract TwoImms {
  i1: Imm;
  i2: Imm;

  init() {
    self.i1 = Imm{a:1};
    self.i2 = Imm{a:2};
  }
}