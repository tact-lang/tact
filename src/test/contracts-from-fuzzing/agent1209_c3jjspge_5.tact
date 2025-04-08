struct OptionalComplex {
    val: Int?;
    nested: Nested?;
}

struct Nested {
    addr: Address?;
    flag: Bool?;
    slice: Slice?;
    cell: Cell?;
}

contract OptTest {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{
            val: null,
            nested: null,
        };
    }
}
