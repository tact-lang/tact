// very long struct (diverse types)
struct LongStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address;
  k: Address?;
  l: Cell?;
  m: Slice?;
  n: Builder?;
}

contract LongStructStorage {
  s: LongStruct;

  init() {
    self.s = LongStruct {
      a: 1, b: true, c: "hi", d: emptyCell(), e: emptyCell().asSlice(), f: beginCell(),
      g: null, h: null, i: null, j: myAddress(), k: null, l: null, m: null, n: null
    };
  }
}
