struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionals {
    st: SOpt;

    init() {
        self.st = SOpt{
            a: null,
            b: true,
            c: null
        };
    }
}