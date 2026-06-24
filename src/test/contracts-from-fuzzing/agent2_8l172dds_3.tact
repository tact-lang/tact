struct Sample {
  a: Int;
  b: Bool?;
  c: String?;
}

contract Test {
  data: Sample;

  init() {
    self.data = Sample{
      a: 2,
      b: false,
      c: null
    };
  }
}