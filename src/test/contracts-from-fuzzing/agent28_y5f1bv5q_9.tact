struct SOpt {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract Test {
    f: SOpt;

    init() {
        self.f = SOpt{
            s: null,
            b: true,
            i: null
        };
    }
}