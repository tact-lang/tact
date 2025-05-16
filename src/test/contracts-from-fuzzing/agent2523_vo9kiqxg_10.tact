struct MixedSerialization {
  intVal: Int as int64;
  uintVal: Int as uint64;
  smallInt: Int as int8;
  bigInt: Int as int257;
  coinVal: Int as coins;
  flag: Bool;
  text: String;
  optionalInt: Int?;
}

contract SerialFieldTest {
  data: MixedSerialization;
  init() {
    self.data = MixedSerialization{
      intVal:5,uintVal:7,smallInt:1,bigInt:123456789123456789,
      coinVal:ton("1.5"),flag:true,text:"mix",optionalInt:null,
    };
  }
}
