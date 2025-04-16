struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract InitPartialNulls {
    s: SOpt;

    init() {
        self.s = SOpt{
            a: null,
            b: null,
            c: "hello"
        };
    }
}
