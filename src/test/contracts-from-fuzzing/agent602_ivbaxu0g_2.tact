struct OptionalNest {
    field1: Int?;
    field2: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OptionalNestTest {
    value: OptionalNest;

    init() {
        self.value = OptionalNest{ field1: null, field2: null };
    }
}
