struct InlineSer {
  a: Int as uint8;
  b: Int as int16;
  c: Bool;
  d: Int? as uint32;
}

contract InlineSerTest {
  s: InlineSer;

  init() {
    self.s = InlineSer{ a:5, b:-10, c:true, d:100 };
  }
}