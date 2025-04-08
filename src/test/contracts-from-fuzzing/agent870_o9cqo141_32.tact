struct Crazy {
  a: Int;
  b: Bool;
  c: String;
  d: String?;
  e: Int as uint8;
  f: Int as int12;
  g: Int?;
  h: Bool?;
  i: Int as coins;
  j: Address;
  k: Address?;
  l: Cell;
  m: Cell?;
  n: Slice;
  o: Slice?;
  p: Builder;
  q: Builder?;
}

contract CrazyCombo {
  data: Crazy;

  init() {
    self.data = Crazy{
      a:1,b:true,c:"hi",d:null,e:2,f:123,g:null,h:null,i:1000,j:myAddress(),k:null,l:emptyCell(),m:null,n:emptyCell().asSlice(),o:null,p:beginCell(),q:null
    };
  }
}