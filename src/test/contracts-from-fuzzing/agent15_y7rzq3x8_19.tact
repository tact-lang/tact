struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            a: null,
            b: null,
            c: "hello",
            d: 42,
            e: true,
            f: null,
        };
    }
}