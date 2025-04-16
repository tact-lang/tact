struct Level3 { d: Int; e: Bool; }
struct Level2 { c: Level3; }
struct Level1 { b: Level2; }

contract DeepChain {
  a: Level1;

  init() {
    self.a = Level1{b: Level2{c: Level3{d: 123, e: true}}};
  }
}