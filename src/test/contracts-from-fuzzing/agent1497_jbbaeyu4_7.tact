struct OptionalPrimitive {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract PrimitivesOpt {
    opt: OptionalPrimitive;

    init() {
        self.opt = OptionalPrimitive{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}