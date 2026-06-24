// Test struct serialization annotations
struct NestedInts {
    u4: Int as uint4;    // 0..15
    s7: Int as int7;    // -64..63
    u12: Int as uint12; // 0..4095
}

contract SerializeAnnots {
    s: NestedInts;
    init() {
      self.s = NestedInts {
        u4: 10,
        s7: -20,
        u12: 3000
      };
    }
}
