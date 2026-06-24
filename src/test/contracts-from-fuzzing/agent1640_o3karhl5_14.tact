struct WithManyFields {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
  f: Bool;
  g: Int;
  h: Bool;
  i: Int;
  j: Bool;
}

contract LargeStructField {
  field: WithManyFields;

  init() {
    self.field = WithManyFields{
      a: 1, b: false, c: 2, d: true, e: 3,
      f: false, g: 4, h: true, i: 5, j: false
    };
  }
}