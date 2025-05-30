struct StrDefaults {
    foo: String = "hello";
    bar: String = "world";
    baz: String = "!";
    num: Int;
}

contract TestContract {
    s: StrDefaults;

    init() {
        self.s = StrDefaults{ num: 5 };
    }
}