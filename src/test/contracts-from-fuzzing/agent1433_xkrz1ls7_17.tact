struct NestedStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    value: NestedStrings;
    init() {
        self.value = NestedStrings{
            a: "one",
            b: null,
            c: "three",
            d: "four",
        };
    }
}