struct SDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
}

contract HasDefaultStruct {
    f: SDefault;

    init() {
        self.f = SDefault{};
    }
}