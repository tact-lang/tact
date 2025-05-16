struct S {
  x: Int;
  y: Bool;
  z: String;
  c: Cell;
  optI: Int?;
  optB: Bool?;
  optStr: String?;
  optC: Cell?;
}

contract StructVariety {
  s: S;

  init() {
    self.s = S{
      x: 1,
      y: false,
      z: "zzz",
      c: emptyCell(),
      optI: null,
      optB: null,
      optStr: null,
      optC: null
    };
  }
}