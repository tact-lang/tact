struct Level3 { v3: Int; }
struct Level2 { v2: Level3; }
struct Level1 { v1: Level2; }
struct Root { rootVal: Level1; extra: Int; }

contract MultiNest {
    field: Root;

    init() {
        self.field = Root{ rootVal: Level1{ v1: Level2{ v2: Level3{ v3: 7 } } }, extra: 99 };
    }
}
