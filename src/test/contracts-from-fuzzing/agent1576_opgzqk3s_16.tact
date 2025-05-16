struct S {
  i: Int;
  b: Bool;
  s: String;
  c: Cell;
  sl: Slice;
  a: Address;
}

contract MultiStructs {
  s1: S;
  s2: S;
  s3: S;

  init() {
    self.s1 = S{ i:1, b:true,  s:"a", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress() };
    self.s2 = S{ i:2, b:false, s:"b", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress() };
    self.s3 = S{ i:3, b:true,  s:"c", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress() };
  }
}