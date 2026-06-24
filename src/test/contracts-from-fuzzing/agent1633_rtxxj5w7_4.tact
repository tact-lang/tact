struct OptionalNestedInner {
    val: Cell?;
}

struct OptionalNested {
    optInner: OptionalNestedInner?;
    val: Int;
}

contract TestContract {
    testField: OptionalNested;

    init() {
        self.testField = OptionalNested{
            optInner: null,
            val: 77,
        };
    }
}