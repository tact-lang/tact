// Very large struct with defaulted optionals
struct BigOpt {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?;
  f: Int?;
  g: Int?;
  h: Int?;
  i: Int?;
  j: Int?;
  k: Int?;
  l: Int?;
  m: Int?;
  n: Int?;
  o: Int?;
}

contract BigOptTest {
  many: BigOpt;
  init() {
    self.many = BigOpt{ a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null, i:null, j:null, k:null, l:null, m:null, n:null, o:null };
  }
}