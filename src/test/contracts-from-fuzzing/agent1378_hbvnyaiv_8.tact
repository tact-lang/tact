struct Level1 { f1: Int; }
struct Level2 { f2: Int; lev1: Level1; }
struct Level3 { f3: Int; lev2: Level2; }
struct Level4 { f4: Int; lev3: Level3; }
struct Level5 { f5: Int; lev4: Level4; }

contract DeepChain {
    storage: Level5;

    init() {
        self.storage = Level5{
            f5: 5,
            lev4: Level4{
                f4: 4,
                lev3: Level3{
                    f3: 3,
                    lev2: Level2{
                        f2: 2,
                        lev1: Level1{
                            f1: 1
                        }
                    }
                }
            }
        };
    }
}
