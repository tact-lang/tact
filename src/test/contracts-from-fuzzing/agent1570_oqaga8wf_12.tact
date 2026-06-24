struct Level3 { a: Int; }
struct Level2 { b: Int; c: Level3; }
struct Level1 { d: Level2; e: Int; }

contract MutuallyNested {
    s: Level1;

    init() {
        self.s = Level1{
            d: Level2{
                b: 1,
                c: Level3{ a: 2 }
            },
            e: 3
        };
    }
}