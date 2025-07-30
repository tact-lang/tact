struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStorage {
    s: SOpt;

    init() {
        self.s = SOpt{
            a: 10,
            b: true,
            c: null
        };
    }
}