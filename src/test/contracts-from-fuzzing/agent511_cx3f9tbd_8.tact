struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int?; // optional defaults to null
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}