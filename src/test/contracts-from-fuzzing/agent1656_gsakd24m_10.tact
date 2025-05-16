struct Defaults {
    foo: Int = 1;
    bar: String = "bar";
    baz: Bool = true;
}

contract DefaultsStruct {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}