struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptStore {
    stored: MultiOption;

    init() {
        self.stored = MultiOption{ a: null, b: true, c: null };
    }
}
