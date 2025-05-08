struct Level4 {
    x: Int?;
    y: Bool?;
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
    nestedDeep: Level1;

    init() {
        self.nestedDeep = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ x: 42, y: null }
                }
            }
        };
    }
}