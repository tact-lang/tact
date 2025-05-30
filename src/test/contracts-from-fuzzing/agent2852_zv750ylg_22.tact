struct TestOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TopOpt {
    s: TestOpt;

    init() {
        self.s = TestOpt{ a:null, b:null, c:null, d:null };
    }
}