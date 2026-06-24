struct OptionalNested {
    inner: Int?;
    nestedStruct: Nested?;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract TestContract {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            inner: null,
            nestedStruct: Nested{ x: 5, y:true }
        };
    }
}