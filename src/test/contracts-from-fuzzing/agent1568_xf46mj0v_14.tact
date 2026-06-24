struct S1 {
  a: Int as int64;
  b: String;
}

struct S2 {
  p: S1;
  flag: Bool;
}

contract SerializationHints {
  g: S2;

  init() {
    self.g = S2{
      p: S1{a:7,b:"h"},
      flag: true,
    };
  }
}