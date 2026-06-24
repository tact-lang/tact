struct Level3 { e: String }
struct Level2 { d: Level3 }
struct Level1 { c: Level2 }

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ c: Level2{ d: Level3{ e: "deep" } } };
    }
}