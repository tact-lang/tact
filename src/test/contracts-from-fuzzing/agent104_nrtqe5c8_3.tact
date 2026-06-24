struct DeepNest3 {
  z: Int;
}

struct DeepNest2 {
  y: DeepNest3;
}

struct DeepNest1 {
  x: DeepNest2;
}

contract MultiLevelNested {
  deep: DeepNest1;

  init() {
    self.deep = DeepNest1{
      x: DeepNest2{
        y: DeepNest3{
          z: 777
        }
      }
    };
  }
}