struct Level1 { x: Int }
struct Level2 { a: Level1 }
struct Level3 { b: Level2 }
struct Level4 { c: Level3 }
struct Level5 { d: Level4 }
struct Level6 { e: Level5 }

contract DeepSix {
    data: Level6;

    init() {
        self.data = Level6{ e: Level5{ d: Level4{ c: Level3{ b: Level2{ a: Level1{ x: 1 } } } } } };
    }
}