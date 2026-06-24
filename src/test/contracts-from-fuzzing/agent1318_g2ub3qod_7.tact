struct Mixed {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Builder;
  f: Slice;
  g: String;
}

contract Test {
  mixed: Mixed;

  init() {
    self.mixed = Mixed{
      a:1,b:true,c:myAddress(),d:emptyCell(),
      e:beginCell(),f:emptyCell().asSlice(),
      g:"str"
    };
  }
}