struct Contained {
  b: Bool;
  s: String;
}

contract Big {
  int1: Int;
  int2: Int;
  int3: Int;
  boolOpt: Bool?;
  strOpt: String?;
  c: Contained;

  init() {
    self.int1 = 1;
    self.int2 = 2;
    self.int3 = 3;
    self.boolOpt = null;
    self.strOpt = "hi";
    self.c = Contained{b:true, s:"nested"};
  }
}
