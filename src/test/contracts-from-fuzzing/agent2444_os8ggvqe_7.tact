struct Level3 {
    baz: String;
}

struct Level2 {
    bar: Level3;
}

struct Level1 {
    foo: Level2;
}

contract DeeplyNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            foo: Level2{
                bar: Level3{
                    baz: "hello"
                }
            }
        };
    }
}
