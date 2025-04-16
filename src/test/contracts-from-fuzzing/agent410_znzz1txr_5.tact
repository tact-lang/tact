struct SubA { a: Int; }
struct SubB { b: Bool; }

struct LevelTwo {
  sa: SubA;
  sb: SubB;
  val: Int?;
}

contract DeepNest {
  field: LevelTwo;
  init() {
    self.field = LevelTwo{ sa: SubA{a:1}, sb: SubB{b:true}, val:null };
  }
}
