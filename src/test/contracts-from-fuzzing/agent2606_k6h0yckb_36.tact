contract AliasUnaligned {
  x: Int as uint3;
  y: Int as int9;

  init() {
    self.x = 7;
    self.y = 256;
  }
}