struct ManyBools {
  a: Bool; b: Bool; c: Bool;
  d: Bool; e: Bool; f: Bool;
  g: Bool; h: Bool; i: Bool;
}

contract ManyBitsPacked {
  payload: ManyBools;
  init() {
    self.payload = ManyBools{
      a:true,b:true,c:false,d:false,e:true,f:true,g:false,h:true,i:false
    };
  }
}