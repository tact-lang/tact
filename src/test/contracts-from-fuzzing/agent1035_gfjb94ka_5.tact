struct InnerOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalFields {
    s: InnerOptional = InnerOptional{ a: null, b: null };
    init() {
        self.s = InnerOptional{ a: 12, b: true };
    }
    receive() {}
}