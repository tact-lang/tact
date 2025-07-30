struct Level4 { d: Int; }
struct Level3 { c: Level4; d: Int; }
struct Level2 { b: Level3; c: Int; }
struct Level1 { a: Level2; b: Int; }

contract MixedDepth {
    store: Level1;

    init() {
        self.store = Level1 {
            a: Level2 {
                b: Level3 {
                    c: Level4 { d: 1 },
                    d: 2
                },
                c: 3
            },
            b: 4
        };
    }
}