struct Mix {
  a: Int;
  b: Bool?;
  c: String;
  d: Int?;
  e: String?;
}

contract InterleavedOptional {
  m: Mix;
  init() {
    self.m = Mix{ a:1, b:null, c:"x", d:null, e:null };
  }
}