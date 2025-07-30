struct Large {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
}

contract LargeStructTest {
  val: Large;

  init() {
    self.val = Large{
      a: 1,
      b: true,
      c: "a",
      d: null,
      e: false,
      f: "b",
      g: 2,
      h: false,
      i: "c",
      j: 3
    };
  }
}