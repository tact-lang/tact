// Persistent struct with nested struct containing optional string
struct Sub {
  msg: String?;
}

struct Top {
  sub: Sub;
  x: Int;
}

contract OptionalInNested {
  info: Top;

  init() {
    self.info = Top{
      sub: Sub{ msg: null },
      x: 5
    };
  }
}
