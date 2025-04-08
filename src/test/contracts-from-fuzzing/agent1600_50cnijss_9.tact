struct Level3 {
    leaf1: Int;
    leaf2: Bool;
}

struct Level2 {
    mid: Level3;
    flag: Bool;
}

struct Level1 {
    root: Level2;
    num: Int;
}

contract TestContract {
    tree: Level1;

    init() {
        self.tree = Level1{
            root: Level2{
                mid: Level3{ leaf1: 42, leaf2: false },
                flag: true
            },
            num: 7
        };
    }
}