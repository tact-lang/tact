struct Level4 { val: Int }
struct Level3 { l4: Level4 }
struct Level2 { l3: Level3 }
struct Level1 { l2: Level2 }
struct RootStruct { l1: Level1 }

contract DeeplyNested {
    store: RootStruct;

    init() {
        self.store = RootStruct{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        l4: Level4{ val: 99 }
                    }
                }
            }
        };
    }
}
