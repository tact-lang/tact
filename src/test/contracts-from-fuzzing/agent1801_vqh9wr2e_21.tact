struct Crazy {
  a: Int?;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract CrazyCombo {
  x: Crazy;
  y: Crazy?;

  init() {
    self.x = Crazy{
      a:null,b:true,c:"hi",d:1,e:false,f:null
    };
    self.y = null;
  }
}