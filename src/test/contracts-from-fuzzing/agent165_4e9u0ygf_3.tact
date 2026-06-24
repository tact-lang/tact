struct Nested {
    f1: Int;
    f2: Bool?;
    f3: String;
}

contract TestNested {
    data: Nested;

    init() {
        self.data = Nested{
            f1: 42,
            f2: null,
            f3: "foo"
        };
    }
}