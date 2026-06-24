struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    opt: OptionalFields;

    init() {
        self.opt = OptionalFields{a: null, b: true, c: null};
    }

    receive() {
        let q = self.opt;
    }
}