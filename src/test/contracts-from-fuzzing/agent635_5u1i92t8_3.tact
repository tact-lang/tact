struct Deep {
    level2: Nested?;
}

struct Nested {
    number: Int;
    flag: Bool;
}

contract OptionalNested {
    data: Deep;

    init() {
        self.data = Deep{ level2: Nested{ number: 1, flag: false } };
    }
}