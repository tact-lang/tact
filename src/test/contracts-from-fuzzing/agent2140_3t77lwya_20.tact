struct BigInner {
  f1: Int;
  f2: Bool;
  f3: String?;
  f4: Cell;
  f5: Slice;
}

contract ManyBigInits {
  i1: BigInner;
  i2: BigInner;
  i3: BigInner;

  init() {
    self.i1 = BigInner{ f1:1, f2:true, f3:null, f4:emptyCell(), f5:emptyCell().asSlice() };
    self.i2 = BigInner{ f1:2, f2:false, f3:"X", f4:emptyCell(), f5:emptyCell().asSlice() };
    self.i3 = BigInner{ f1:3, f2:true, f3:"Y", f4:emptyCell(), f5:emptyCell().asSlice() };
  }
}
