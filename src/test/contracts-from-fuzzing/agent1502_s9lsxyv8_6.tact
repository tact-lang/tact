struct Level1 { a: Int; }
struct Level2 { b: Level1; }
struct Level3 { c: Level2; }

contract TestContract {
    s: Level3;
    init() {
        self.s = Level3{
            c: Level2{
                b: Level1{ a: 42 }
            }
        };
    }
}