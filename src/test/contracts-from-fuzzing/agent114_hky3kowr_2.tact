struct NestedInner {
    intField: Int;
    stringField: String;
}

struct NestedOuter {
    nested: NestedInner;
    boolField: Bool;
}

contract NestedStructContract {
    nestedOuter: NestedOuter;

    init() {
        self.nestedOuter = NestedOuter{
            nested: NestedInner{
                intField: 123,
                stringField: "nested",
            },
            boolField: false,
        };
    }
}