struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptContract {
    s: OptionalFields = OptionalFields{};

    init() {
        self.s = OptionalFields{a: null, b: true, c: null};
    }

    receive() {
        if (self.s.b != null) {
            let _ = self.s.b!!;
        }
    }
}