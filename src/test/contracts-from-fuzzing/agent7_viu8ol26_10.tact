struct Sub {
    v: Int = 1;
}

contract MixedDefaults {
    a: Int;
    b: Int = 10;
    s: Sub;

    init() {
        self.a = 5;
        self.s = Sub{};
    }
}
