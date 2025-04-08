struct Mix {
  i: Int;
  b: Bool;
  s: String;
  oInt: Int?;
  oBool: Bool?;
  oStr: String?;
}

contract MixTypes {
  field: Mix;

  init() {
    self.field = Mix{i:42, b:true, s:"hello", oInt:null, oBool:false, oStr:null};
  }
}