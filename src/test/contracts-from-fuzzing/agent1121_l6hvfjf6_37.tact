struct Level1 { x: Int }
struct Level2 { l1: Level1 }
struct Level3 { l2: Level2 }
struct Level4 { l3: Level3 }
struct Level5 { l4: Level4 }

contract FiveLevelNestedStruct {
    data: Level5;

    init() {
        self.data = Level5{l4: Level4{l3: Level3{l2: Level2{l1: Level1{x:1}}}}};
    }
}