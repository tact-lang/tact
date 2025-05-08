struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    m: MultiOpt;

    init() {
        self.m = MultiOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}