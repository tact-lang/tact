struct Ints {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
}

contract IntFields {
  many: Ints;

  init() {
    self.many = Ints{a:1,b:2,c:3,d:4,e:5};
  }
}