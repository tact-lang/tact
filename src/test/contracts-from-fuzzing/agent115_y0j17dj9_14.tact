struct MultiOpt {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MultiOptPersist {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            a: 1, b: null, c: true, d: null, e: "hi", f: null
        };
    }
}