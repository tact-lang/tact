struct Defaults {
    foo: Int = 123;
    bar: Bool = false;
    baz: String = "hello";
}

contract TestContract {
    v: Defaults;
    init() {
        self.v = Defaults{};
    }
}