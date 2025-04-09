struct WithOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    s: WithOptional;
    init() {
        self.s = WithOptional{ a: null, b: null, c: null };
    }
}