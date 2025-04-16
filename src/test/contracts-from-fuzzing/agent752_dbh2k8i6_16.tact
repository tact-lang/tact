struct ZeroSized {
  a: Int as uint1;
  b: Int as uint1;
  c: Int as uint1;
}

contract TinyBits {
  sz: ZeroSized;

  init() {
    self.sz = ZeroSized{ a:1, b:0, c:1 };
  }
}