struct Nested {
    lvl1: Int;
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
    flag: Bool;
}

struct Level3 {
    name: String;
    val: Int;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{ lvl1: 1, lvl2: Level2{ lvl3: Level3{ name: "a", val: 2 }, flag: true } };
    }
}
