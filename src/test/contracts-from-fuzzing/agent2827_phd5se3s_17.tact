struct SLong {
  a: Int;
  b: Bool;
  c: String;
  d: Bool;
  e: String;
  f: Int;
  g: Bool;
  h: String;
}

contract HoldLong {
  s: SLong;
  init() {
    self.s = SLong{
      a:1,b:true,c:"x",d:false,e:"y",f:2,g:true,h:"z"
    };
  }
}