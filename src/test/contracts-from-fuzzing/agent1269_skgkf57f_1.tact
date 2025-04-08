struct Nested { x: Int; y: Int?; z: DeepNested; }
struct DeepNested { a: Int; b: Int?; }
contract TestContract {
  data: Nested;
  init() {
    self.data = Nested{
      x: 1,
      y: null,
      z: DeepNested{ a: 2, b: null },
    };
  }
}
