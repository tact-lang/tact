struct LargeNested {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
  f: Bool?;
  g: Address;
  h: Cell;
  i: Slice;
  j: Address?;
  k: Cell?;
  l: Slice?;
}

struct TopLevel {
  nested1: LargeNested;
  nested2: LargeNested;
}

contract DoubleLargeNestTest {
  storage: TopLevel;

  init() {
    self.storage = TopLevel{
      nested1: LargeNested{
        a:1,b:"a",c:true,d:null,e:null,f:null,g:myAddress(),h:emptyCell(),i:emptyCell().asSlice(),j:null,k:null,l:null
      },
      nested2: LargeNested{
        a:2,b:"b",c:false,d:null,e:null,f:null,g:myAddress(),h:emptyCell(),i:emptyCell().asSlice(),j:null,k:null,l:null
      }
    };
  }
}
