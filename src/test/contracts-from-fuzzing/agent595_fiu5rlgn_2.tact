struct Nested {
    first: Int;
    second: Bool;
    third: String;
}

contract TestNestedStruct {
    s: Nested;

    init() {
        self.s = Nested{
            first: 7,
            second: false,
            third: "abc",
        };
    }
}