struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: Slice?;
    str: String?;
}

contract TestContract {
    field: OptionalPrimitives;

    init() {
        self.field = OptionalPrimitives{
            i: null,
            b: null,
            a: null,
            c: null,
            s: null,
            str: null
        };
    }
}