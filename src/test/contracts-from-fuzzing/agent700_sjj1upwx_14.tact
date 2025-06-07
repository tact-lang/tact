struct OptString {
  s: String?;
}

struct OptBool {
  b: Bool?;
}

struct OptInt {
  i: Int?;
}

contract OptionUnion {
  s: OptString;
  b: OptBool;
  i: OptInt;

  init() {
    self.s = OptString{s:null};
    self.b = OptBool{b:null};
    self.i = OptInt{i:null};
  }
}