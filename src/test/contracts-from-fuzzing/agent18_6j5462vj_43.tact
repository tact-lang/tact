struct Prim {
  a: Int;
  b: Bool;
  c: String;
}

contract PrimAssign {
  x: Prim;

  init() {
    self.x = Prim{ a:1, b:true, c:"x" };
  }
}