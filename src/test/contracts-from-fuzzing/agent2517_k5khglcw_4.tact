struct InnerMost { value: Int }
struct Inner { nested: InnerMost }
struct Outer { wrapped: Inner }

contract Test {
  data: Outer;

  init() {
    self.data = Outer{ wrapped: Inner{ nested: InnerMost{ value: 42 } } };
  }
}