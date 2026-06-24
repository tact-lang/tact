struct BoolFields {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract TestContract {
    flags: BoolFields;

    init() {
        self.flags = BoolFields{
            a: true,
            b: false,
            c: true,
            d: false,
            e: true,
        };
    }
}