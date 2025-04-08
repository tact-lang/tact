struct OptNested {
    foo: Int?;
}

struct Holder {
    wrapped: OptNested?;
}

contract NestedOptionalFieldTest {
    holder: Holder;

    init() {
        self.holder = Holder{ wrapped: null };
    }
}