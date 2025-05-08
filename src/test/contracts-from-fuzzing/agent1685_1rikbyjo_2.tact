struct Nested {
    one: Int;
    two: Bool;
}

struct MoreNested {
    nested: Nested;
    three: String;
}

contract DeepContract {
    info: MoreNested;

    init() {
        self.info = MoreNested{
            nested: Nested{
                one: 7,
                two: false,
            },
            three: "deep",
        };
    }
}
