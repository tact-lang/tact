struct EmbeddedOptionals {
  i: Int?;
  s: String?;
  b: Bool?;
}

contract InternalOptionals {
  e: EmbeddedOptionals;

  init() {
    self.e = EmbeddedOptionals{i:null,s:null,b:true};
  }
}