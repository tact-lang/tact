struct Nested {
    innerField: Int?;
    boolFlag: Bool;
}

struct Outer {
    nestedField: Nested;
    intField: Int;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            nestedField: Nested{
                innerField: null,
                boolFlag: false,
            },
            intField: 1,
        };
    }
}