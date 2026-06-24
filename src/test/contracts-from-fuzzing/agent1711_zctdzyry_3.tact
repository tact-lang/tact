struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

struct OuterWithNestedOptional {
    inner: NestedOptionals?;
    val: Int;
}

contract TestNestedOptionalField {
    data: OuterWithNestedOptional;

    init() {
        self.data = OuterWithNestedOptional{
            inner: null,
            val: 123
        };
    }
}