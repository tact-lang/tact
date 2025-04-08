struct HasBool {
  b1: Bool;
  b2: Bool;
  b3: Bool;
  b4: Bool;
}
struct HasStr {
  s1: String;
  s2: String;
  s3: String;
}

struct Combo {
  hasBool: HasBool;
  hasStr: HasStr;
}

contract MixNested {
  field: Combo = Combo{
    hasBool: HasBool{b1:false, b2:true, b3:false, b4:true},
    hasStr: HasStr{s1:"a", s2:"b", s3:"c"}
  };
}