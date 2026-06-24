struct Inner {
  x: Int?;
  y: Bool?;
}

contract OptStructField {
  data: Inner?;

  init() {
    self.data = Inner{
      x: null,
      y: null,
    };
  }
}
