struct MixedSerialize {
  a: Int as uint8;
  b: Int as int64;
  c: Int;
  d: Bool;
  e: String;
}

struct Wrapper {
  inner: MixedSerialize;
}

contract NestedSerialization {
  data: Wrapper = Wrapper{ inner: MixedSerialize{ a:1,b:2,c:3,d:true,e:"hi" } };
  init() {
    self.data = Wrapper{ inner: MixedSerialize{ a:4,b:5,c:6,d:false,e:"bye" } };
  }
  receive() {}
}