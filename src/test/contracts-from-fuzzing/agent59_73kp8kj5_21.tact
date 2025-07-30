struct Level3 { c: Int; }
struct Level2 { b: Level3; }
struct Level1 { a: Level2; }

contract NestedLevels {
    l1: Level1;
    l2: Level1;

    init() {
        self.l1 = Level1{ a: Level2{ b: Level3{ c: 1 }}};
        self.l2 = Level1{ a: Level2{ b: Level3{ c: 2 }}};
    }
}
