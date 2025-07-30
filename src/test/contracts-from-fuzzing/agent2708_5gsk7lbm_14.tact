struct RecA { val: Int }
struct RecB { val: Bool }
struct RecC { val: String }

struct Combination {
  a: RecA;
  b: RecB;
  c: RecC;
}

contract StructMix {
  x: Combination;
  
  init() {
    self.x = Combination{ a: RecA{val:1}, b: RecB{val:true}, c: RecC{val:"hi"} };
  }
}