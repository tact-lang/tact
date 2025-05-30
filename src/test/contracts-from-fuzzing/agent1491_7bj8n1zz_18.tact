struct BigOptional {
  a: Int?; b: Bool?; c: String?; d: Int?; e: Bool?;
  f: String?; g: Int?; h: Bool?; i: String?; j: Int?;
  k: Bool?; l: String?; m: Int?; n: Bool?; o: String?;
  p: Int?; q: Bool?; r: String?; s: Int?; t: Bool?;
}

contract TestContract {
  data: BigOptional;
  init() {
    self.data = BigOptional{
      a: 1, b: null, c: "hi", d: null, e: true,
      f: "x", g: null, h: false, i: null, j: 42,
      k: null, l: "y", m: null, n: null, o: null,
      p: -1, q: true, r: "z", s: null, t: false
    };
  }
}