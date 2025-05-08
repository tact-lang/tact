// test trailing comma in struct instantiation in contract field
struct TrailTest {
  a: Int;
  b: Bool;
  c: Int?;
}

contract TrailingCommaStruct {
  f: TrailTest = TrailTest {
    a: 1,
    b: false,
    c: null,
  };
  init() {}
}