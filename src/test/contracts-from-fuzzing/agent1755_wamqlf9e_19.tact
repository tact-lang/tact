struct BothOpt {
    a: Int?;
    b: String?;
}

contract OptStructField {
    data: BothOpt;
    init() {
        self.data = BothOpt{
            a: null,
            b: null
        };
    }
}