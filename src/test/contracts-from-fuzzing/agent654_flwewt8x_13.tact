struct Sample {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: Sample;
    init() {
        self.s = Sample{ a: null, b: null, c: null };
    }
}