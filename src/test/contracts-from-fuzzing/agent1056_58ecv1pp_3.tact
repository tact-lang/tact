struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3?;
    flag: Bool;
}

struct Level1 {
    nested: Level2?;
    number: Int;
}

contract DeepNestedOptionals {
    state: Level1;

    init() {
        self.state = Level1{
            nested: Level2{
                nested: null,
                flag: true,
            },
            number: 999,
        };
    }
}