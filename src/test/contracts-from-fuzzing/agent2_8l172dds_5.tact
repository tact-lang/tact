// Large flat struct with many primitive types
struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int;
  e: Bool;
  f: String;
  g: Int;
  h: Bool;
  i: String;
  j: Int;
}

contract Test {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: false,
      c: "one",
      d: 2,
      e: true,
      f: "two",
      g: 3,
      h: false,
      i: "three",
      j: 4
    };
  }
}