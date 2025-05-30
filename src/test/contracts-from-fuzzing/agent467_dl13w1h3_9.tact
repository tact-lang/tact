// Struct with many optional fields
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
}

contract OptionalHeavy {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
