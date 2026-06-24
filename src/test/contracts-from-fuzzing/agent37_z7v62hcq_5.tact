struct TestOpt {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract Test {
    data: TestOpt;
    init() {
        self.data = TestOpt{
            s: null,
            n: null,
            b: null,
        };
    }
}