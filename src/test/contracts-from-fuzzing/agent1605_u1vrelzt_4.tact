struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    l3: Level3;
}

struct Level1 {
    x: Address;
    l2: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: myAddress(),
            l2: Level2{
                y: true,
                l3: Level3{
                    z: 42
                }
            }
        };
    }

    receive() {
        self.nested = Level1{
            x: myAddress(),
            l2: Level2{
                y: false,
                l3: Level3{
                    z: 43
                }
            }
        };
    }
}