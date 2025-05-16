struct OptionalAndDefaultNested {
    nestedOpt: Inner?;
}

struct Inner {
    intVal: Int = 42;
    strVal: String?;
}

contract OptDefNestedTest {
    data: OptionalAndDefaultNested;

    init() {
        self.data = OptionalAndDefaultNested{
            nestedOpt: Inner{
                strVal: "abc"
            }
        };
    }
}
