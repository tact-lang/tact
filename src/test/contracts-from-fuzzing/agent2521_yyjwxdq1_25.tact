struct InnerS {
  i: Int as uint8;
}

struct OuterS {
  big: Int as int256;
  inner: InnerS;
}

contract ConfSerial {
  os: OuterS;

  init() {
    self.os = OuterS{
      big: -1234567890,
      inner: InnerS{ i: 250 }
    };
  }
}
