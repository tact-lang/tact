struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    inner: Level3?;
    flag: Bool;
}

struct Level1 {
    inner: Level2?;
    tag: Int;
}

contract TestContract {
    tree: Level1 = Level1{inner: null, tag: 5};

    init() {
        self.tree = Level1{inner: Level2{inner: Level3{a: 1, b: false}, flag: true}, tag: 10};
    }
}