// Struct contains a default-initialized nested struct
struct Inner {
  x: Int = 17;
}

contract DefaultNestedStruct {
  data: Inner;

  init() {
    self.data = Inner{};
  }
}