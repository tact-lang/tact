struct BigOpts {
  a: Int?; b: Bool?; c: String?;
  d: Int?; e: Bool?; f: String?;
  g: Int?; h: Bool?; i: String?;
}

contract ManyOptionals {
  stuff: BigOpts = BigOpts{
    a: 1, b: null, c: "x",
    d: null, e: false, f: null,
    g: null, h: true, i: null
  };

  init() {}
}
