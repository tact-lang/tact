struct Level2 {
    value: Int;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    note: String;
}

contract DeepNestedFields {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{ value: 42, flag: true },
            note: "deep"
        };
    }
}