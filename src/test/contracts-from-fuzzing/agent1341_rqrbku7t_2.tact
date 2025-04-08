struct Level1 {
    value1: Int;
    optional1: Int?;
    nested: Level2;
}

struct Level2 {
    value2: String;
    optional2: String?;
}

contract NestedStructStorage {
    data: Level1;

    init() {
        self.data = Level1{
            value1: 1,
            optional1: null,
            nested: Level2{
                value2: "test",
                optional2: null,
            },
        };
    }
}