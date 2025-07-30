// Deep optional chains in nested structs
struct Leaf { val:Int?; }
struct Mid { leaf:Leaf?; }
struct Top { mid:Mid?; }

contract Test {
  value: Top;

  init() {
    self.value = Top{ mid: null };
  }
}