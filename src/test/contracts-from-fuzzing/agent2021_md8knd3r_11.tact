struct OptPrimitive {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: String?;
}

contract OptPrimitivesContract {
    ps: OptPrimitive;

    init() {
        self.ps = OptPrimitive{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
