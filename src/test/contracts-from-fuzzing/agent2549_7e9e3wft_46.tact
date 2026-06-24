struct Holders {
  i: Int;
  b: Bool;
  s: String;
}

contract ManyInit {
  a: Holders;
  b: Holders;
  c: Holders;

  init() {
    self.a = Holders{i:1,b:true,s:"x"};
    self.b = Holders{i:2,b:false,s:"y"};
    self.c = Holders{i:3,b:true,s:"z"};
  }
}