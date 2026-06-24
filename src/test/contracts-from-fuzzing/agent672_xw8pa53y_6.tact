struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
}

contract MultiOptionalFields {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{ a: null, b: null, c: true, d: null };
    }
}
