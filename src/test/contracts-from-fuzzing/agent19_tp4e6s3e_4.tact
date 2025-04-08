struct LongOrdered {
  a: Int as uint8;
  b: Int as int16;
  c: Int as coins;
  d: Int;
  e: Bool;
  f: Bool?;
  g: Int?;
  h: Bool;
  i: Int as uint32;
}

contract TestContract {
  persist: LongOrdered;

  init() {
    self.persist = LongOrdered{
      a:1,b:2,c:3,d:4,e:true,f:null,g:null,h:false,i:5
    };
  }
}
