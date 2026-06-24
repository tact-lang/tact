struct LongMixed {
 a: Int as int64;
 b: Bool;
 c: String;
 d: Int?;
 e: Address?;
 f: Cell;
 g: Slice;
 h: Builder;
}

contract UseLongMixed {
 data: LongMixed;
 
 init() {
  self.data = LongMixed{
    a: -1000,
    b: false,
    c: "TEXT",
    d: null,
    e: null,
    f: emptyCell(),
    g: emptyCell().asSlice(),
    h: beginCell()
  };
 }
 receive() {}
}