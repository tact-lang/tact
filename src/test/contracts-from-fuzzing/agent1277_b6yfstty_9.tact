struct Test {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
}

contract TestContract {
  s: Test;
  init() {
    self.s = Test{
      a:1, b:true, c:"abc", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(),
      g:null, h:null, i:null, j:null
    };
  }
}