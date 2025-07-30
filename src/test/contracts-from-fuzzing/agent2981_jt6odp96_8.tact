contract MultiPrimitiveStorage {
  x: Int;
  y: Bool;
  z: Int?;
  addr: Address;
  sl: Slice;
  cl: Cell;
  s: String;
  builder: Builder;

  init() {
    self.x = 0;
    self.y = true;
    self.z = null;
    self.addr = myAddress();
    self.sl = "hi".asComment().asSlice();
    self.cl = emptyCell();
    self.s = "test string";
    self.builder = beginCell();
  }
}