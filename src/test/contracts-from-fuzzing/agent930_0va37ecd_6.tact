struct OneFieldDefault {
    x: Int = 42;
}

contract StructDefaultVal {
    s: OneFieldDefault;

    init() {
        self.s = OneFieldDefault{};
    }
}
