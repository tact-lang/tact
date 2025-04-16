struct Level1 { a: Int? }
struct Level2 { b: Level1? }
struct Level3 { c: Level2? }

contract Test {
    d: Level3;

    init() {
        self.d = Level3{
            c: null,
        };
    }
}
