struct WithDefaults {
    a: Int = 7;
    b: String = "hello";
    c: Bool = true;
    d: Int?; // defaults to null implicitly
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}