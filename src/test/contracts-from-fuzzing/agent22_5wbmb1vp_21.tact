struct Defaulted {
    foo: Int = 5;
    bar: String = "hi";
    baz: Bool = true;
}

contract UsesDefaults {
    dd: Defaulted;

    init() {
        self.dd = Defaulted{};
    }
}