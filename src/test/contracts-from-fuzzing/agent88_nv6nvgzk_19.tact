struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    param: SOpt;

    init() {
        self.param = SOpt{
            a: null,
            b: null,
            c: null
        };
    }
}