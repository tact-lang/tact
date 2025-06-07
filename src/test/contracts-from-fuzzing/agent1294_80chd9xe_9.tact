struct Level3 {
    num: Int;
}

struct Level2 {
    l3: Level3;
    optional_inner: Level3?;
}

struct Level1 {
    nested: Level2;
    optional_nested: Level2?;
}

contract MultiOptional {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                l3: Level3{num: 1},
                optional_inner: null
            },
            optional_nested: null
        };
    }
}
