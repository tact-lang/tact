struct SubNested {
  a: Int;
}

contract NullableStructField {
  s: SubNested?;

  init() {
    self.s = null;
  }
}