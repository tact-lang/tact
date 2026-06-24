struct Level1 {
    val1: Int;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepLayers {
    state: Level3;
    
    init() {
        self.state = Level3{
            l2a: Level2{
                l1a: Level1{ val1: 1 },
                l1b: Level1{ val1: 2 }
            },
            l2b: Level2{
                l1a: Level1{ val1: 3 },
                l1b: Level1{ val1: 4 }
            }
        };
    }
}