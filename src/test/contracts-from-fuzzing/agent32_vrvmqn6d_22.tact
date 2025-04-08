struct MixedPrimitives {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  bl: Builder;
}

contract Test {
  v: MixedPrimitives;
  init() {
    self.v = MixedPrimitives{
      i:1,b:true,s:"s",c:emptyCell(),sl:emptyCell().asSlice(),bl:beginCell()
    };
  }
}