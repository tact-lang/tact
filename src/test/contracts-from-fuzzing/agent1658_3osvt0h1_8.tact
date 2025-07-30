struct Level3 { c: Int; }
struct Level2 { b: Level3; }
struct Level1 { a: Level2; }

contract DeepStructField {
    s: Level1;

    init() {
        self.s = Level1{ a: Level2{ b: Level3{ c: 55 } } };
    }
}