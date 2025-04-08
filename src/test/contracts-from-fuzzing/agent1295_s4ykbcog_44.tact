// nested optional struct with explicit serialization inside
struct Bottom {
  x: Int as uint8;
}

struct Mid {
  inner: Bottom?;
}

contract NestedSerializeOpt {
  val: Mid?;

  init() {
    self.val = Mid{
      inner: Bottom{ x: 255 }
    };
  }
}