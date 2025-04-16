struct BitStruct {
  flag: Bool;
  tiny: Int as uint3;
  val: Int as int16;
}

contract WithBits {
  bits: BitStruct;

  init() {
    self.bits = BitStruct{flag:true, tiny:7, val:-100};
  }
}