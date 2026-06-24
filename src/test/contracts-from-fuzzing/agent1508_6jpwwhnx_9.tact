struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    optPrims: OptionalPrimitives;

    init() {
        self.optPrims = OptionalPrimitives{
            a: null, b: true, c: null, d: null, e: null, f: "hello"
        };
    }
}