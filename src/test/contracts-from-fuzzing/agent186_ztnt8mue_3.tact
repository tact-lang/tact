struct DeepNest {
  level1: Int;
  level2: InnerLevel;
}

struct InnerLevel {
  x: Int;
  y: Bool;
  z: Leaf;
}

struct Leaf {
  flag: Bool;
  note: String;
}

contract TestContract {
  data: DeepNest;
  init() {
    self.data = DeepNest{
      level1: 1,
      level2: InnerLevel{ x:2, y:true, z:Leaf{ flag:false, note:"hi" } }
    };
  }
}