struct OptionalNest {
    val1: Int?;
    val2: Nested?;
}

struct Nested {
    subval: Int;
}

contract TestOptionalNest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val1: null,
            val2: Nested{subval: 42}
        };
    }
}
