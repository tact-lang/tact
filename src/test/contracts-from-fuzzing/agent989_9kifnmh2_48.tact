// multiple optional fields inside one struct
struct MultiOpt {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract ManyOpts {
  f: MultiOpt;
  init() {
    self.f = MultiOpt{ a:null, b:null, c:null };
  }
}