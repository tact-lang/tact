struct WithDefaults {
    foo: Int = 77;
    bar: Bool = false;
    text: String = "hi";
    a: Int = -1;
    b: Bool = true;
}

contract TestContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}