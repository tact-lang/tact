struct Inner { a: Int; b: Bool; c: String }

struct Outer { x: Int; nested: Inner; y: String }

contract Test {
  field: Outer;

  init() {
    self.field = Outer{
      x: 1,
      nested: Inner{ a: 42, b: false, c: "abc" },
      y: "done"
    };
  }
}
