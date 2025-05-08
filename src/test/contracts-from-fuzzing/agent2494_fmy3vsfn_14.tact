struct IntsAndOptionals {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
}

contract MixedOptionals {
  stuff: IntsAndOptionals;
  init() {
    self.stuff = IntsAndOptionals{a:4,b:null,c:5,d:7};
  }
}