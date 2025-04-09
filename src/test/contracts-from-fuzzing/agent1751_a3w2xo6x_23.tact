struct OptionalNestedStruct {
    nestedOpt: Inner?;
}

struct Inner {
    str: String;
    val: Int?;
}

contract OptionalNestedTest {
    d: OptionalNestedStruct;

    init() {
        self.d = OptionalNestedStruct{
            nestedOpt: Inner{ str: "data", val: null }
        };
    }
}
