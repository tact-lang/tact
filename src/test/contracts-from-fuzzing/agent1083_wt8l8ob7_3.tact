struct Level3 {
    a: Int;
}

struct Level2 {
    b: Level3;
    c: Level3?;
}

struct Level1 {
    d: Level2;
    e: Level2?;
}

contract DeepCombo {
    storage: Level1;

    init() {
        self.storage = Level1{
            d: Level2{
                b: Level3{a: 10},
                c: null
            },
            e: null
        };
    }
}