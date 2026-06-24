struct Level4 { v4: Int; }
struct Level3 { v3: Level4; }
struct Level2 { v2: Level3; }
struct Level1 { v1: Level2; }

contract TestContract {
    deeplyNested: Level1;
    init() {
      self.deeplyNested = Level1{v1: Level2{v2: Level3{v3: Level4{v4: 99}}}};
    }
}