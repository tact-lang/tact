struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestNest {
    nestedVal: Nested;

    init() {
        self.nestedVal = Nested{
            a: 1,
            b: null,
            c: "abc",
        };
    }
}