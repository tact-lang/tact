struct AllPrimitives {
  i: Int;
  b: Bool;
  s: String;
  cl: Cell;
  sl: Slice;
  a: Address;
}

contract MixedTypes {
  data: AllPrimitives;
  init() {
    self.data = AllPrimitives{
      i:1, b:false, s:"hi", cl:emptyCell(), sl:emptyCell().asSlice(), a:myAddress()
    };
  }
}