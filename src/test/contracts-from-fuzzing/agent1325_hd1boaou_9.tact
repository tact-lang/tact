struct OptionalFields {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
}

contract TestContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{
            a: null,
            b: 5,
            c: null,
            d: true
        };
    }

    receive() {
        self.opt = self.opt;
    }
}