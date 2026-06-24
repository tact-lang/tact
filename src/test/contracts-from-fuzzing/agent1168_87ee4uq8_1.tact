struct SimpleOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    optData: SimpleOpt;

    init() {
        self.optData = SimpleOpt{
            a: null,
            b: null,
            c: null
        };
    }
}