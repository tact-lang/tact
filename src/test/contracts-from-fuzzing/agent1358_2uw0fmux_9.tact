struct DeepWide {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: String;
  f: Int?;
  g: Bool?;
  h: Address?;
  i: Cell?;
  j: String?;
}

struct Wrapper {
  f1: DeepWide;
  f2: DeepWide;
  f3: DeepWide;
}

contract MultiNested {
  big: Wrapper;

  init() {
    self.big = Wrapper{
      f1: DeepWide{ a:1,b:true,c:myAddress(),d:emptyCell(),e:"a",f:null,g:null,h:null,i:null,j:null },
      f2: DeepWide{ a:2,b:false,c:myAddress(),d:emptyCell(),e:"b",f:null,g:null,h:null,i:null,j:null },
      f3: DeepWide{ a:3,b:true,c:myAddress(),d:emptyCell(),e:"c",f:null,g:null,h:null,i:null,j:null }
    };
  }
}