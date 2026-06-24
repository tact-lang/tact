struct InlineOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract InlineOptTest {
    f: InlineOptionals;

    init() {
        self.f = InlineOptionals{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}