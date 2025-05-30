struct Mixed {
  a: Int;
  b: Bool;
  c: String;
  d: String?;
  e: Bool?;
}

contract Mix {
  x: Mixed = Mixed{ a:1,b:true,c:"x",d:null,e:null };

  init() {
    self.x = self.x;
  }

  receive() {
    self.x = self.x;
  }
}