struct Data {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
}

contract BigMix {
  field: Data;

  init() {
    self.field = Data{
      a:1, b:true, c:"test", d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:myAddress()
    };
  }
}
