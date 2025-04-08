struct InnerOptional {
    s: String?;
}

contract OptStringHolder {
    data: InnerOptional;

    init() {
        self.data = InnerOptional{ s: null };
    }
}