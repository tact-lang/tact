struct Nested {
    i: Int;
    flag: Bool;
}

struct Container {
    n: Nested;
    text: String;
    number: Int;
}

contract DeepNestTest {
    d: Container;

    init() {
        self.d = Container{
            n: Nested{ i: 1, flag: true },
            text: "deep",
            number: 42,
        };
    }
}
