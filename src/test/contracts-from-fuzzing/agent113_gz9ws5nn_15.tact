struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract TestManyOptionals {
  o: ManyOptionals;

  init() {
    self.o = ManyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null
    };
  }
}