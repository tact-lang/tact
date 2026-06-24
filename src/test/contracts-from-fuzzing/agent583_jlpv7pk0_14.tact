struct Level3 {
    x: Int;
    y: Bool?;
}

struct Level2 {
    a: Int?;
    b: Level3;
}

struct Level1 {
    foo: Level2?;
    bar: String;
}

contract MixedDeep {
    store: Level1;

    init() {
        self.store = Level1{
            foo: Level2{
                a: 10,
                b: Level3{
                    x: 100,
                    y: null
                }
            },
            bar: "end"
        };
    }
}