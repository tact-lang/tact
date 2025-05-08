struct BoolFields {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract BoolContract {
    flags: BoolFields;

    init() {
        self.flags = BoolFields{
            b1: true,
            b2: false,
            b3: true,
            b4: false
        };
    }
}