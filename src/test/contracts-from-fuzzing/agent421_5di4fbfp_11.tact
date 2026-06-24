struct DeeplyOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract ManyOpts {
  values: DeeplyOptional;

  init() {
    self.values = DeeplyOptional{
      a:null, b:null, c:null, d:null
    };
  }
}