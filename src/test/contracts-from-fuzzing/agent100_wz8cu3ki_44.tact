struct TwoOpts {
    o1: Int?;
    o2: String?;
}

contract Test45 {
    val1: TwoOpts;
    val2: TwoOpts;

    init() {
        self.val1 = TwoOpts{ o1: null, o2: null };
        self.val2 = TwoOpts{ o1: null, o2: null };
    }
}