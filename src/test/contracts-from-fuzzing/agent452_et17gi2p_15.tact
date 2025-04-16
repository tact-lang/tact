struct NestedSer {
  a: Int as int64;
  b: Bool;
}

struct OuterSer {
  inner: NestedSer;
  note: String;
}

contract NestedSerialization {
  st: OuterSer;

  init() {
    self.st = OuterSer{
      inner: NestedSer{
        a: 12345,
        b: true,
      },
      note: "note",
    };
  }
}