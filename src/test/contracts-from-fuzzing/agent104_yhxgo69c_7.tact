struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{ a: null, b: null, c: null };
    }
}