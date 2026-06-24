struct HasDefaults {
    x: Int = 10;
    y: Bool = true;
    s: String = "abc";
    o: Int?; // implicitly defaults to null
}

contract Test {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}