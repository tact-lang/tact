struct SDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
}

contract DefaultsStruct {
    d: SDefault;

    init() {
        self.d = SDefault{};
    }
}