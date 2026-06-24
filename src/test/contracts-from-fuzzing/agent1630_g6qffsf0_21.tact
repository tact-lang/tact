struct ComplexA { x: Int; y: Bool; }
struct ComplexB { a: ComplexA; s: String; }

contract ComposeStructs {
  ab: ComplexB;

  init() {
    self.ab = ComplexB{ a: ComplexA{ x: 3, y: true }, s: "hi" };
  }
}