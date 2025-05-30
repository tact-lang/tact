struct Chain6 {
  a:Int;
  b:Int;
  c:Int;
  d:Int;
  e:Int;
  f:Int;
}

contract LongStruct {
  chain: Chain6;
  init() {
    self.chain = Chain6{ a:1,b:2,c:3,d:4,e:5,f:6 };
  }
}