struct One { a: Int; b: Bool; }
struct Two { x: String; y: One; z: Int; }
contract StructCombo {
  s: Two;
  init() {
    self.s = Two{ x:"hi", y: One{ a:1, b:true }, z:99 };
  }
}