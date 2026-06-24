struct SerialMix {
  a: Int as uint3;
  b: Int as int7;
  c: Int as uint12;
  d: Int as int21;
}

contract SerialMixContract {
  s: SerialMix;

  init() {
    self.s = SerialMix{
      a: 7,
      b: -64,
      c: 4095,
      d: -1048576
    };
  }
}