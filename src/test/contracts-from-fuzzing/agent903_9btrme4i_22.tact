struct RichDefault {
    foo: Int = 5;
    bar: Bool = false;
    baz: String = "qwe";
    qux: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract DefaultsInStruct {
    s: RichDefault;

    init() {
        self.s = RichDefault{};
    }
}