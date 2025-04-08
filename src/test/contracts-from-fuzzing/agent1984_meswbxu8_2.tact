struct Level3 {
    foo: Int;
    bar: Int?;
}

struct Level2 {
    nested1: Level3;
    nested2: Level3;
    optionalNested: Level3?;
}

struct Level1 {
    nested2: Level2;
}

contract NestedTest {
    state: Level1;

    init() {
        self.state = Level1{
            nested2: Level2{
                nested1: Level3{ foo: 1, bar: null },
                nested2: Level3{ foo: 2, bar: 3 },
                optionalNested: null,
            },
        };
    }
}