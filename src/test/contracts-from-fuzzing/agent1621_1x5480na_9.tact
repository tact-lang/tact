struct X {
  val: Int;
}

struct Y {
  val: X;
}

struct Z {
  val: Y;
}

contract DeepChain {
  z: Z;

  init() {
    self.z = Z{ val: Y{ val: X{ val: 42 } } };
  }
}