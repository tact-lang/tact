struct Level2 {
    opt: Int?;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ opt: null, flag: false } };
    }
}