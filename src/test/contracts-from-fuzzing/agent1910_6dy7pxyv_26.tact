struct Defaulted {
    a: Int = 42;
    b: String = "default";
    c: Bool = false;
}

contract WithDefaultsStruct {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}
