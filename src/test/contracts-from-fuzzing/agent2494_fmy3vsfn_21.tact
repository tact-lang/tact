struct Blended {
  i: Int;
  s: String?;
  b: Bool;
  optInt: Int?;
}

contract MixedBlend {
  field: Blended;

  init() {
    self.field = Blended{
      i:9, s:null, b:true, optInt:null
    };
  }
}