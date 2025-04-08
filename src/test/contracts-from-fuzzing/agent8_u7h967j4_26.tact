struct Level1 {
    foo: Int;
    bar: Bool?;
}

struct Level2 {
    baz: String?;
    nested: Level1;
}

contract OptionNestCombo {
    data: Level2;
    init() {
        self.data = Level2{
            baz: null,
            nested: Level1{ foo:123, bar: true }
        };
    }
}