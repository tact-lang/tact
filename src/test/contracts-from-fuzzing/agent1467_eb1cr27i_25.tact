struct ComposeDefaults {
    n: Int = 0;
    f: Bool = false;
    t: String = "";
}

contract UsesDefaults {
    data: ComposeDefaults;
    init() {
        self.data = ComposeDefaults{};
    }
}