struct SN {
    v: Int;
}

contract OptionalStructField {
    n: SN?;

    init() {
        self.n = SN{ v: 9 };
    }
}