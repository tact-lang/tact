struct VarIntSizes { a8:Int as uint8; a16:Int as int16; a32:Int as uint32; a64:Int as int64; a128:Int as uint128; }

contract VarIntSizeTest {
   v: VarIntSizes;
   init() {
      self.v = VarIntSizes{
         a8:5,
         a16:-10,
         a32:10000,
         a64:-5000000000,
         a128:123123123123123123,
      };
   }
}