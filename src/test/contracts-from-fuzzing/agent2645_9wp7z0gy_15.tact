struct SDefault {
    a: Int = 1;
    b: String = "s";
    c: Bool = false;
}

contract DefaultStructField {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}
