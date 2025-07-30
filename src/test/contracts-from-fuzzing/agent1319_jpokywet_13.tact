struct SDefault {
    a: Int = 42;
    b: Bool = false;
    c: String = "default string";
}

contract Defaults {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}