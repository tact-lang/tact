struct Bottom {
  x: Int = 42;
  y: Bool?;
  z: String = "hi";
}

struct Middle {
  inside: Bottom?;
}

contract DefaultAndOptionals {
  val: Middle;

  init() {
    self.val = Middle{
      inside: null,
    };
  }
}
