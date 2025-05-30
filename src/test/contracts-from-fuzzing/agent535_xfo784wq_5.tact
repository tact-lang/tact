struct ManyFields {
  f1: Int;
  f2: Int;
  f3: Bool;
  f4: Address?;
  f5: String;
  f6: Cell;
  f7: Slice;
  f8: Builder;
}

contract BigStructVarOptAddr {
  s: ManyFields;

  init() {
    self.s = ManyFields{
      f1:1,f2:2,f3:true,f4:null,f5:"str",f6:emptyCell(),f7:emptySlice(),f8:beginCell()
    };
  }
}