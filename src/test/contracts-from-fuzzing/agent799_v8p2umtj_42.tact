struct ABool {
    b: Bool;
}

struct AString {
    s: String;
}

contract ManySmallStructs {
    s1: ABool;
    s2: AString;
    s3: ABool; 
    s4: AString;

    init() {
      self.s1 = ABool{b:true};
      self.s2 = AString{s:"x"};
      self.s3 = ABool{b:false};
      self.s4 = AString{s:"y"};
    }
}