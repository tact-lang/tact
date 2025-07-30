struct Level2 {
    flag: Bool;
    message: String;
}

struct Level1 {
    number: Int;
    nested: Level2;
    optNested: Level2?;
}

contract NestedStructTest {
    store: Level1;

    init() {
        self.store = Level1{
            number: 42,
            nested: Level2{ flag: true, message: "hello" },
            optNested: null
        };
    }
}