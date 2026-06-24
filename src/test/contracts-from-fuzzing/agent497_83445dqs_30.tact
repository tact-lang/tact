struct EmbedMany {
  x: Int;
  y: Bool?;
  s: String;
}

contract EmbedComplex {
  e1: EmbedMany;
  e2: EmbedMany;

  init() {
    self.e1 = EmbedMany{x:1,y:null,s:"one"};
    self.e2 = EmbedMany{x:2,y:true,s:"two"};
  }
}