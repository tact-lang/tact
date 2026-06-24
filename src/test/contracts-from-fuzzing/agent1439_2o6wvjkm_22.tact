struct Params {
    foo: Int = 42;
    bar: Int?;
    name: String = "abc";
}

contract LargeDefaults {
    p: Params;
    init() {
        self.p = Params{};
    }
}