struct OptMixed {
    a: Slice?;
    b: Slice;
    c: Int?;
    d: Bool?;
    e: Int;
}

contract TestContract {
    store: OptMixed;

    init() {
        self.store = OptMixed{
            a: null,
            b: "abc".asComment().asSlice(),
            c: 77,
            d: true,
            e: 42
        };
    }
}