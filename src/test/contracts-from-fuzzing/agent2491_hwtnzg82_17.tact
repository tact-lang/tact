struct Mixed {
  i: Int;
  b: Bool?;
  s: String;
  o: Int?;
}

contract MixedContract {
  field: Mixed;

  init() {
    self.field = Mixed{i:5,b:null,s:"hi",o:10};
  }
}