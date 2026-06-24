struct TripleOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTripleContract {
    data: TripleOpt;

    init() {
        self.data = TripleOpt{
            a: null,
            b: null,
            c: null
        };
    }
}