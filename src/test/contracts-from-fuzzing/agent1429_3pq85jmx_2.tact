struct Nested {
    inner: Int;
    flag: Bool?;
    label: String;
    optStr: String?;
}

struct Outer {
    first: Nested;
    second: Nested;
}

contract TestContract {
    nestedOuter: Outer;

    init() {
        self.nestedOuter = Outer{
            first: Nested{ inner: 1, flag: true, label: "test", optStr: null },
            second: Nested{ inner: 2, flag: null, label: "more", optStr: "hey" }
        };
    }
}