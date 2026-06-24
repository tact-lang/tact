struct Level3 {
    score: Int? = 15;
    desc: String? = null;
}

struct Level2 {
    l3: Level3? = null;
    flag: Bool? = true;
}

struct Level1 {
    value: Int = 100;
    l2: Level2 = Level2{};
}

contract NestedOptionalsDefaults {
    field: Level1;

    init() {
        self.field = Level1{};
    }
}