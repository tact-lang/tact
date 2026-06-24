// Struct with various primitive types, all optional, nested in contract
struct OptionalPrims {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionalPrimitives {
    stuff: OptionalPrims;

    init() {
        self.stuff = OptionalPrims{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}