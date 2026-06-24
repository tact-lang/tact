struct Level2 {
    foo: Int;
    bar: Bool?;
}

struct Level1 {
    inner: Level2;
    comment: String;
}

contract Test {
    nested: Level1;
    init() {
        self.nested = Level1{ inner: Level2{ foo: 13, bar: null }, comment: "nested" };
    }
}