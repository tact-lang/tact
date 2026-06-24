// Nested struct with large integers
struct Bottom {
  x: Int as int257;
}

struct Mid {
  b: Bool;
  bottom: Bottom;
}

struct Top {
  mid: Mid;
  val: Int as uint256;
}

contract LargeIntNest {
  value: Top;

  init() {
    self.value = Top{
      mid: Mid{
        b: true,
        bottom: Bottom{ x: -1234567890 }
      },
      val: 1234567890
    };
  }
}