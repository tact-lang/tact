struct Level3 { k: Int; }

struct Level2 { j: Level3; optBool: Bool?; }

struct Level1 { i: Level2; }

contract DeepNested {
    storage: Level1 = Level1{
        i: Level2{
            j: Level3{ k: 100 },
            optBool: null
        }
    };

    init() {
        self.storage = Level1{
            i: Level2{
                j: Level3{ k: 200 },
                optBool: true
            }
        };
    }
}
