struct InnerZero {
    a: Int = 0;
}

contract InitDefaults {
    f: InnerZero;

    init() {
        self.f = InnerZero{};
    }
}