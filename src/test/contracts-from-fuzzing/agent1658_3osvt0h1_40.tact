struct S {
  i: Int;
  s: String;
}

struct Cont {
  a: S;
  b: S;
  c: S;
}

contract ManySameStructStorage {
  rec: Cont;
  init() {
    self.rec = Cont{
      a:S{i:1,s:"a"},
      b:S{i:2,s:"b"},
      c:S{i:3,s:"c"}
    };
  }
}