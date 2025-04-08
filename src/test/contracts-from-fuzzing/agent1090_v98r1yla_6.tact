struct Defaults {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "hello";
}

contract DefaultStructField {
    state: Defaults;

    init() {
        self.state = Defaults{};
    }
}