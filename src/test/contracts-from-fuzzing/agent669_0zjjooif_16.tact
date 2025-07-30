struct SDefault {
    a: Int = 7;
    b: String = "x";
    c: Bool?;
}

contract HasDefaultStruct {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}