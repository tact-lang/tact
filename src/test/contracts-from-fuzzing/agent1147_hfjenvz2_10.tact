struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int?;  // default null optional
    e: Bool?; // default null optional
    f: String?;
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}