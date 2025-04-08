struct Inner {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            f1: null,
            f2: null,
            f3: "abc",
        };
    }
}
