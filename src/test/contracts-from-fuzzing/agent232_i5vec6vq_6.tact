struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}