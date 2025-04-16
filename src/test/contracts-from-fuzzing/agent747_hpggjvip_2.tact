struct Nested {
    flag: Bool;
    count: Int;
}

struct Wrapper {
    nested: Nested;
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper {
            nested: Nested {
                flag: true,
                count: 123,
            },
        };
    }
}