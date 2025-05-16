struct Level4 { d: Int }
struct Level3 { c: Level4 }
struct Level2 { b: Level3 }
struct Level1 { a: Level2 }

contract FourDeep {
    f: Level1;

    init() {
        self.f = Level1{ a: Level2{ b: Level3{ c: Level4{ d:42 } } } };
    }
}