contract PrimitivesOptionalEnergy {
 a: Bool?;
 b: String?;
 c: Cell?;
 d: Slice?;

 init() {
  self.a = null;
  self.b = null;
  self.c = emptyCell();
  self.d = emptyCell().asSlice();
 }
}