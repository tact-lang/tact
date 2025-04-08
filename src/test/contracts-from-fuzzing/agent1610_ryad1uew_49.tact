struct Reordered {
    a: Int;
    b: Bool;
    c: String;
}

contract ReorderedFields {
    field: Reordered;

    init() {
        self.field = Reordered{
            c: "hello",
            b: true,
            a: 42
        };
    }
}