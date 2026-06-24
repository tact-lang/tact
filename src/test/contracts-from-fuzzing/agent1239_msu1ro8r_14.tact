contract MixTypes {
  i: Int;
  b: Bool;
  s: String;
  oInt: Int?;
  oBool: Bool?;
  oString: String?;

  init() {
    self.i = 10;
    self.b = false;
    self.s = "s";
    self.oInt = null;
    self.oBool = true;
    self.oString = null;
  }
}