// Struct with multiple optionals default-initialized mixed-in
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    field: ManyOpts;

    init() {
        self.field = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
