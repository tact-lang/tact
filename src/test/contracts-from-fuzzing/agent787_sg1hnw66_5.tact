struct Level3 { q: Int }
struct Level2 { p: Level3 }
struct Level1 { s: Level2 }

contract TestContract {
    deep: Level1 = Level1{ s: Level2{ p: Level3{ q: 0 } } };

    init() {
        self.deep = Level1{ s: Level2{ p: Level3{ q: 123 } } };
    }
}