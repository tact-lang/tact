struct SOpt {
    s1: Int?;
    s2: String?;
    s3: Bool?;
}

contract OptStructField {
    data: SOpt;

    init() {
        self.data = SOpt{
            s1: 5,
            s2: null,
            s3: true
        };
    }
}