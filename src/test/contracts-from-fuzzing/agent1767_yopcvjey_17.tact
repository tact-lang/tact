struct Level1 { a: Int; }
struct Level2 { b: Level1; }
struct Level3 { c: Level2; }
struct Level4 { d: Level3; }
struct Level5 { e: Level4; }

contract DeepFive {
    v: Level5;

    init() {
        self.v = Level5{ e: Level4{ d: Level3{ c: Level2{ b: Level1{ a: 10 } } } } };
    }
}
