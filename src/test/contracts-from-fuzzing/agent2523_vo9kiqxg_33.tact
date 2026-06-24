// Optional contains nested with serialization
struct Encoded {
  a:Int as uint32;
  b:Int as int64;
  flag:Bool;
}
struct OutOpt {
  enc: Encoded?;
}
contract OptSerialStruct {
  data: OutOpt;
  init() {
    self.data = OutOpt {
      enc:null
    };
  }
}