struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract Defaulted {
    d: ManyDefaults;

    init() {
        self.d = ManyDefaults{};
    }
}