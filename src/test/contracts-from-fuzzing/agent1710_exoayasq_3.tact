struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    m: MultiOpt;

    init() {
        self.m = MultiOpt{
            a: null,
            b: true,
            c: "hello"
        };
    }
}