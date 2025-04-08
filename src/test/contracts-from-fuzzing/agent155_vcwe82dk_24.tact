struct Level5 {
    leaf: Int?;
}

struct Level4 {
    l5: Level5;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    deeplyNested: Level1 = Level1{
        l2: Level2{
            l3: Level3{
                l4: Level4{
                    l5: Level5{ leaf: null }
                }
            }
        }
    };

    init() {
        self.deeplyNested = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{ leaf: null }
                    }
                }
            }
        };
    }
}