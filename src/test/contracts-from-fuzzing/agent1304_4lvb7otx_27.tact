struct SAnn {
 u4: Int as uint4;
 u8: Int as uint8;
 u16: Int as uint16;
 u32: Int as uint32;
 i4: Int as int4;
 i8: Int as int8;
 i16: Int as int16;
 i32: Int as int32;
}

contract SerialStruct {
 data: SAnn;

 init() {
  self.data = SAnn{ u4:1,u8:2,u16:3,u32:4,i4:-1,i8:-2,i16:-3,i32:-4 };
 }
}