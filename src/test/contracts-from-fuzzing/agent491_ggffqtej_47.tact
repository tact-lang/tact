// Testing a struct with a mix of everything and no options
struct AllPrims {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
}

contract PrimMix {
  mix: AllPrims;

  init() {
    self.mix = AllPrims{
      a:1,b:true,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress()
    };
  }
}
