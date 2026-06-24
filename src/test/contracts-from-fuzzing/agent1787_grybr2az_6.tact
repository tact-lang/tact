struct OptionalNested {
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptionalNestedStructTest {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{nestedOpt: null};
    }
}