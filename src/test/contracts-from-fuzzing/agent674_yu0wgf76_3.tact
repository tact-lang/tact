struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

contract TestContract {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}