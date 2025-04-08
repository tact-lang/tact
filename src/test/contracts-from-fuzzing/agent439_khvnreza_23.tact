struct Compose {
  nested: Nested;
  value: Int;
}

struct Nested {
  val1: Int;
  val2: String;
}

contract Test23 {
  x: Compose;

  init() {
    self.x = Compose{
      nested: Nested{
        val1: 10,
        val2: "hi",
      },
      value: 999,
    };
  }

  receive() {}
}