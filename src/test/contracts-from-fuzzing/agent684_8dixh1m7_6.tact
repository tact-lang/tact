struct PrimitiveOptions {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptPrimitivesTest {
    state: PrimitiveOptions;
    init() {
        self.state = PrimitiveOptions {
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null,
        };
    }
}