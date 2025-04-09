struct AllOpt {
    a: Int?;
    s: String?;
    b: Bool?;
}

contract AllOptional {
    foo: AllOpt;

    init() {
        self.foo = AllOpt{};
    }
}
