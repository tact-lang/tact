struct SerOpt1 {
  a: Int as int64;
  b: Int?;       
}
struct SerOpt2 {
  x: SerOpt1?;
  y: Int as uint8;
}
struct SerOpt3 {
  z: SerOpt2?;
}

contract MixDeepSerdeOpt {
  state: SerOpt3;

  init() {
    self.state = SerOpt3{
      z: SerOpt2{
        x: SerOpt1{ a:-77, b:null },
        y:255
      }
    };
  }
}