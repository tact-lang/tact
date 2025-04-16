struct Mix {
  a: Int;
  b: String;
  c: Bool;
  d: String;
  e: Int;
  f: Bool;
}

contract TestContract {
  data: Mix;
  init() {
    self.data = Mix{
      a: 1,
      b: "x",
      c: true,
      d: "y",
      e: 2,
      f: false,
    };
  }
}
