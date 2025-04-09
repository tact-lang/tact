struct Level3 {
    x: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2a: Level2{ l3a: Level3{x:1}, l3b: Level3{x:2} },
            l2b: Level2{ l3a: Level3{x:3}, l3b: Level3{x:4} }
        };
    }
}