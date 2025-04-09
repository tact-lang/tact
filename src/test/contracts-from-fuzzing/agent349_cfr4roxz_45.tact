// Persistent storage that is optional of deeply nested struct
struct InnerMost { x: Int; }
struct Inner { m: InnerMost; }
struct Mid { inner: Inner; }
struct Outer { mid: Mid; }

contract OptionalDeepStruct {
  target: Outer?;
  init() {
    self.target = Outer{ mid: Mid{ inner: Inner{ m: InnerMost{ x: 42 } } } };
  }
}