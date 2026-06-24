struct BigNested {
  a: Int;
  b: String?;
  c: Bool;
  d: Address?;
  e: Cell;
  f: Slice?;
}

struct BigWrapper {
  one: BigNested;
  two: BigNested;
}

contract BigNestedWrap {
  dat: BigWrapper;

  init() {
    self.dat = BigWrapper{
      one: BigNested{a:1,b:null,c:true,d:null,e:emptyCell(),f:null},
      two: BigNested{a:2,b:"hi",c:false,d:myAddress(),e:emptyCell(),f:emptyCell().asSlice()}
    };
  }
}