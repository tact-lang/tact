struct InnerDefault {
    x: Int = 0;
    y: Bool = false;
}

contract DefaultStructField {
    f: InnerDefault;

    init() {
        self.f = InnerDefault{};
    }
}