struct Level1 {
    v1: Int;
    l2: Level2;
}
struct Level2 {
    v2: Int;
    l3: Level3;
}
struct Level3 {
    v3: Int;
}

contract NestedChain {
    data: Level1;

    init() {
        self.data = Level1 {
            v1: 1,
            l2: Level2 {
                v2: 2,
                l3: Level3 { v3: 3 }
            }
        };
    }
}