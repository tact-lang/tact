struct IntsAndOptionals {
  a: Int?;
  b: Int;
  c: Int?;
  d: Int;
}

contract MixedOptionalsAndInts {
  data: IntsAndOptionals;

  init() {
    self.data = IntsAndOptionals{
      a:null,
      b:1,
      c:2,
      d:3
    };
  }
}