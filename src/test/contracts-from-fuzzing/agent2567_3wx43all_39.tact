struct ManyBools {
  a: Bool; b: Bool; c: Bool;
  d: Bool; e: Bool; f: Bool;
}
contract ManyBoolFields {
  s: ManyBools;
  init(){
    self.s=ManyBools{a:true,b:false,c:true,d:false,e:true,f:false};
  }
}