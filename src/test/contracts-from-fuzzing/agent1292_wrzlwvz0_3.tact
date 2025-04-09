struct Complex {
  alpha: Bool;
  beta: Int?;
  gamma: Bool?;
  delta: Int;
}

contract Bar {
  field: Complex;

  init() {
    self.field = Complex {
      alpha: true,
      beta: null,
      gamma: false,
      delta: 42
    };
  }
}