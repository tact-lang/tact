struct SInt {
 x: Int as uint128;
}

contract SerialStruct {
 a: SInt;
 
 init() {
  self.a = SInt{ x: 123456789 };
 }
}