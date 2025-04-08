struct Level3 {
    l3field: Int;
}

struct Level2 {
    l2field: Level3;
}

struct Level1 {
    l1field: Level2;
}

contract Deep3 {
    deep: Level1;

    init() {
        self.deep = Level1{
            l1field: Level2{
                l2field: Level3{ l3field: 123 }
            }
        };
    }
}