struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
}

contract Test {
    w: WithDefaults;

    init() {
        self.w = WithDefaults{ d: null, e: null };
    }
}