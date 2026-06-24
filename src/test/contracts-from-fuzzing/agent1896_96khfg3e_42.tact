struct MixBoolInt {
  b1: Bool;
  b2: Bool;
  i: Int;
}

contract BoolIntMixTest {
  val: MixBoolInt;

  init() {
    self.val = MixBoolInt{
      b1:true, b2:false, i:123
    };
  }
}