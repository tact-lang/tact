struct Z { z: String }

struct Y { y: Z? }

struct X { x: Y? }

contract DeepOptional {
  inner: X;

  init() {
    self.inner = X{ x: null };
  }
}
