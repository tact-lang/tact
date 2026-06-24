struct Level3 { x: Int; }
struct Level2 { a: Level3; b: Level3; }
struct Level1 { l: Level2; }

contract TestContract {
    embedded: Level1;

    init() {
        self.embedded = Level1{
            l: Level2{
                a: Level3{x:42},
                b: Level3{x:99}
            }
        };
    }
}