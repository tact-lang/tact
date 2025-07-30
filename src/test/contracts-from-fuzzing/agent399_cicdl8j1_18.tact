struct BoolStuff {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
  h: Bool;
}

contract StructPackedBools {
  s: BoolStuff;

  init() {
    self.s = BoolStuff{
      a:true,b:false,c:true,d:false,
      e:true,f:true,g:false,h:false
    };
  }
}