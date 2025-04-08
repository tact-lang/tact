struct MultipleOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;
    g: Slice?;
}

contract MultiOptTest {
    val: MultipleOptionals;

    init() {
        self.val = MultipleOptionals{
            a: 1,
            b: null,
            c: "hi",
            d: true,
            e: null,
            f: null,
            g: null
        };
    }
}
