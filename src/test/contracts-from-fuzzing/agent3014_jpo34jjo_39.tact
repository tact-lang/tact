// Structs with mix of serialization annotations
struct SerializeMix {
  a: Int;
  b: Int as uint8;
  c: Int as uint64;
  d: Int as coins;
  e: Bool;
}

contract SerializeMixTest {
  field: SerializeMix;

  init() {
    self.field = SerializeMix{
      a:10, b:5, c:1000, d:ton("1"), e:true
    };
  }
}