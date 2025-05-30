struct S {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Bool?;
  f: Int?;
  g: Address;
  h: Slice;
  i: String?;
}

contract TestContract {
  x: S;
  y: S;

  init() {
    self.x = S{ a:1, b:true, c:"hi", d:emptyCell(), e:true, f:null, g:myAddress(), h:emptyCell().asSlice(), i:"yo" };
    self.y = S{ a:10, b:false, c:"bye", d:emptyCell(), e:null, f:20, g:myAddress(), h:emptyCell().asSlice(), i:null };
  }
}