struct WithDefaults {
    foo: Int = 7;
    bar: Bool = false;
    baz: String = "hello";
    opt: Int?; // defaults to null implicitly
}

contract TestContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}