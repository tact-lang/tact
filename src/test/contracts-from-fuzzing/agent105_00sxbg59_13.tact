struct Level1 { f1: Int; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }
struct Level5 { l4: Level4; }
struct Level6 { l5: Level5; }
contract SixLayers {
    storage: Level6;

    init() {
        self.storage = Level6{
            l5: Level5{
                l4: Level4{
                    l3: Level3{
                        l2: Level2{
                            l1: Level1{ f1: 77 },
                        },
                    },
                },
            },
        };
    }
}