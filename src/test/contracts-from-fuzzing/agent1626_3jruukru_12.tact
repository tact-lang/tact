struct ManyOptionals {
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
}

contract TestStorage {
  opt: ManyOptionals;

  init() {
    self.opt = ManyOptionals{
      a: null, b: null, c: 3, d: null, e: 5,
      f: null, g: 7, h: 8, i: null, j: 10
    };
  }
}