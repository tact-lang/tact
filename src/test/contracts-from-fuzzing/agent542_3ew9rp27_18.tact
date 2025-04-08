struct MultiOpt {
    n: Int?;
    s: String?;
    b: Bool?;
}

contract TestOpt {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            n: null,
            s: null,
            b: null
        };
    }
}