struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

struct NestedOptionalOuter {
    inner: OptionalNest;
    x: Int;
}

contract OptionalNestTest {
    data: NestedOptionalOuter;

    init() {
        self.data = NestedOptionalOuter{
            inner: OptionalNest{
                a: null,
                b: true,
                c: null,
                d: emptyCell(),
            },
            x: 77,
        };
    }
}