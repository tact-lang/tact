struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

struct OuterWithInnerOptional {
    inner: NestedOptionals?;
    num: Int;
}

contract OptionalInStructs {
    big: OuterWithInnerOptional;

    init() {
        self.big = OuterWithInnerOptional{
            inner: null,
            num: 5,
        };
    }
}