struct ManyFlags {
  a: Bool;
  b: Bool?;
  c: Bool;
  d: Bool?;
  e: Bool;
  f: Bool?;
  g: Bool;
  h: Bool?;
  i: Bool;
}

contract Test13 {
  flags: ManyFlags;
  init() {
    self.flags = ManyFlags{
      a:true,b:null,c:false,d:true,e:true,f:null,g:false,h:true,i:false
    };
  }
}