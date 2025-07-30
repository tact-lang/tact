struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

contract TestContract {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }

    receive() {}
}