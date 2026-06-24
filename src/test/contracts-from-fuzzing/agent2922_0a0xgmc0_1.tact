struct Nested {
    x: Int;
    y: Int?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            nested: Nested { x: 7, y: null },
            flag: true,
            text: "hello"
        };
    }
}