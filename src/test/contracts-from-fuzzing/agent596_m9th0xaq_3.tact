struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    data: SOpt;

    init() {
        self.data = SOpt{ a: null, b: true, c: "hello" };
    }
}