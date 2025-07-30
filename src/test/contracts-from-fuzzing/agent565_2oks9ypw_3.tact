struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    opts: MultiOptional;

    init() {
        self.opts = MultiOptional{ a: null, b: null, c: null };
    }
}