struct OptionalDeepNesting {
    field1: Int?;
    field2: OptionalNest?;
}

struct OptionalNest {
    nested: Int?;
}

contract OptDeepNestTest {
    state: OptionalDeepNesting;

    init() {
        self.state = OptionalDeepNesting{
            field1: null,
            field2: OptionalNest{ nested: null }
        };
    }
}