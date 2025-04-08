struct Level2 {
    number: Int;
    text: String;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract NestedContract {
    info: Level1;

    init() {
        self.info = Level1{
            nested: Level2{ number: 10, text: "foo" },
            flag: true,
        };
    }
}