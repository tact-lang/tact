struct ZeroField {
    zero: Int = 0;
}

contract ZeroInitializer {
    f: ZeroField;
    init() {
        self.f = ZeroField{};
    }
}