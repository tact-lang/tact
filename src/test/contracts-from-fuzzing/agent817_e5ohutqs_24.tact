struct DeepLevel3 { z: Int; }
struct DeepLevel2 { y: Int; dl3: DeepLevel3; }
struct DeepLevel1 { x: Int; dl2: DeepLevel2; }

contract Test {
  deep: DeepLevel1;

  init() {
    self.deep = DeepLevel1{
      x:11,
      dl2: DeepLevel2{
        y:22,
        dl3: DeepLevel3{ z:33 }
      }
    };
  }
}