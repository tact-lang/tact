struct Level3 {
    foo: Int?;
}

struct Level2 {
    bar: Level3?;
}

struct Level1 {
    baz: Level2?;
}

contract OptionalDeep {
    nest: Level1;

    init() {
        self.nest = Level1{
            baz: Level2{
                bar: Level3{
                    foo: 123,
                },
            },
        };
    }
}
