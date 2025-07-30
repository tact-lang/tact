struct BigOptStruct {
  a: Int?; b: Bool?; c: String?; d: Int?; e: Bool?;
  f: String?; g: Int?; h: Bool?; i: String?; j: Int?;
  k: Bool?; l: String?; m: Int?; n: Bool?; o: String?;
}

contract StoreBigOptStruct {
  s: BigOptStruct;

  init() {
    self.s = BigOptStruct{
      a: null, b: true, c: "c", d: 4, e: null,
      f: "f", g: null, h: false, i: null, j: 10,
      k: true, l: null, m: 13, n: null, o: "last"
    };
  }
}