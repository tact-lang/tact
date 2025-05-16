struct WeirdOrder {
  a: Int?;
  b: Int;
  c: String?;
  d: String;
  e: Bool?;
  f: Bool;
}

contract OrderAndOpt {
  f: WeirdOrder;

  init() {
    self.f = WeirdOrder{
      a:null, b:1, c:null, d:"d", e:null, f:true
    };
  }
}
