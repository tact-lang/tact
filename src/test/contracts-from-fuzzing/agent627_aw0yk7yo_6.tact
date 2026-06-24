struct Level3 {
    leaf: Int;
}

struct Level2 {
    mid: Level3;
    opt: Bool?;
}

struct Level1 {
    branch1: Level2;
    branch2: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            branch1: Level2{ mid: Level3{ leaf: 1 }, opt: null },
            branch2: Level2{ mid: Level3{ leaf: 2 }, opt: true }
        };
    }
}