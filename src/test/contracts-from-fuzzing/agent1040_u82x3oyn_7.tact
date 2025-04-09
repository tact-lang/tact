struct OptionalPrimitive {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptPrimContract {
    vals: OptionalPrimitive;

    init() {
        self.vals = OptionalPrimitive{
            a: null,
            b: null,
            c: null,
        };
    }
}