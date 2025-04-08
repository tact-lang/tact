struct FlatOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract FlatOptTester {
    val: FlatOpt;

    init() {
        self.val = FlatOpt{ a: null, b: null, c: null };
    }
}