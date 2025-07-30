struct Defaults {
    foo: Int = 1;
    bar: String = "hello";
    baz: Bool = true;
}

contract DefaultsStructContract {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}