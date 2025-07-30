struct Nested {
    inner: String;
}

struct Outer {
    innerStruct: Nested;
    flag: Bool;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            innerStruct: Nested{ inner: "test" },
            flag: true,
        };
    }
}
