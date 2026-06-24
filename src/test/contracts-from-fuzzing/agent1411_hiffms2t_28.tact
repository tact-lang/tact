// test struct with various serialization widths
struct MixedSer {
  a: Int as uint4;
  b: Int as int4;
  c: Int as uint8;
  d: Int as int8;
  e: Int as int257;
}

contract TestContract {
    data: MixedSer;
    init() {
        self.data = MixedSer{a:8,b:7,c:255,d:-128,e:123456789};
    }
}