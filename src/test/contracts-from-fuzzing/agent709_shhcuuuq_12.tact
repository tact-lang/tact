struct Mixed {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
}

contract TestContract {
  data: Mixed;

  init() {
    self.data = Mixed{
      a:1,
      b:true,
      c:myAddress(),
      d:emptyCell(),
      e:emptyCell().asSlice(),
      f:"hey",
      g:null,
      h:null
    };
  }
}