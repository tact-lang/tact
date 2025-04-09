// Extremely deeply nested struct chain
struct Level5 {
    x: Int;
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
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            x: 42
                        }
                    }
                }
            }
        };
    }
}