struct OptionalNest {
    val1: Int?;
    val2: Nested?;
}

struct Nested {
    inner: Int?;
}

contract OptionalNestContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val1: null,
            val2: Nested{ inner: null }
        };
    }
}