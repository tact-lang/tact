struct Level2 { b: Int; }
struct Level1 { a: Level2; }
struct Top { t: Level1; }

contract MultiNest {
    store: Top;
    init() {
        self.store = Top{
            t: Level1{
                a: Level2{ b: 123 }
            }
        };
    }
}