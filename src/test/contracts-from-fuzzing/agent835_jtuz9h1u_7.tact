struct Level3 {
    id: Int;
    note: String?;
}

struct Level2 {
    l3: Level3;
    count: Int;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract NestedThreeLevels {
    root: Level1;

    init() {
        let l3 = Level3{ id: 123, note: "deepest" };
        let l2 = Level2{ l3: l3, count: 42 };
        self.root = Level1{ l2: l2, flag: true };
    }
}