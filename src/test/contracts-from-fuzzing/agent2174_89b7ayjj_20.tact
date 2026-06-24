struct AnotherDeeper {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    l4: Level4;
}

struct Level4 {
    val: Int; 
    optStr: String?;
}

contract DeepInits {
    storage: AnotherDeeper;
    init() {
        self.storage = AnotherDeeper{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        l4: Level4{ val: 5, optStr: null }
                    }
                }
            }
        };
    }
}
