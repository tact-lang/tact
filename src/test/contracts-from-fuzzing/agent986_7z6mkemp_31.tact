struct MultiNestedDefaults {
  a: Int = 1;
  b: Bool = false;
  s: String = "x";
  o: Int?;
  p: Bool?;
  q: String?;
}

contract DefaultsMix {
  m: MultiNestedDefaults;

  init() {
    self.m = MultiNestedDefaults{ a:5, b:true, s:"hi", o:null, p:null, q:null };
  }
}