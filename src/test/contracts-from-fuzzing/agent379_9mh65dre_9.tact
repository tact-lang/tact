struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructOptFields {
    data: MultiOptional?;

    init() {
        self.data = null;
    }
}