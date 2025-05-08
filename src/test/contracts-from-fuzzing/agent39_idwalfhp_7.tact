struct MultiLevel {
    a: Int;
    b: Bool;
}

struct Level2 {
    inner: MultiLevel;
    c: String;
}

struct Level3 {
    nested: Level2;
    d: Int;
}

contract DeepNested {
    stuff: Level3;

    init() {
        self.stuff = Level3{
            nested: Level2{
                inner: MultiLevel{
                    a: 10,
                    b: true,
                },
                c: "abc",
            },
            d: 99,
        };
    }
}