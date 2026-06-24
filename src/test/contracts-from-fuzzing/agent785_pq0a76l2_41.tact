// Test big struct with combination of annotated and plain Int fields
struct MixedInts {
  a: Int as uint3;
  b: Int as int5;
  c: Int;
  d: Int as uint64;
  e: Int;
}

contract AnnotMix {
  rec: MixedInts = MixedInts{
    a: 7,
    b: -15,
    c: 12345,
    d: 123456789,
    e: -987654321
  };
  init() {}
}
