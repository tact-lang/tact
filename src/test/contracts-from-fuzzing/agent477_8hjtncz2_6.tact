struct NestedStructWithOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
}

contract NestedOptionalTypesTest {
    storage: NestedStructWithOptionals;

    init() {
        self.storage = NestedStructWithOptionals{
            a: 1,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}