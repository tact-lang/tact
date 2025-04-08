struct Combo {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
}

contract Diverse {
  combo: Combo;

  init() {
    self.combo = Combo{
      a:1,
      b:true,
      c: myAddress(),
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: "hello"
    };
  }
}