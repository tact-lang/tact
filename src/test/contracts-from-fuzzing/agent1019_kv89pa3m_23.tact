struct Part1 { a: Int; b: Bool; }
struct Part2 { c: Int; d: Bool; }

contract PackCross {
  f1: Part1;
  f2: Part2;

  init() {
    self.f1 = Part1{ a:1, b:true };
    self.f2 = Part2{ c:2, d:false };
  }
}
