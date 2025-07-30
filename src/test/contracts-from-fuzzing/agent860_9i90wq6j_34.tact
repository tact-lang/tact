message(1) MsgA { x: Int }
message(2) MsgB { y: Int }

struct Complex {
  a: MsgA;
  b: MsgB;
}

contract MsgFields {
  f: Complex;

  init() {
    self.f = Complex{
      a: MsgA{x:1},
      b: MsgB{y:2}
    };
  }
}