// struct with primitive defaults assigned
struct DefaultsPrimitives {
  a: Int = 77;
  b: Bool = true;
  c: String = "hello";
}

contract DefPrimitivesStorage {
  prims: DefaultsPrimitives;

  init() {
    self.prims = DefaultsPrimitives{};
  }
}
