struct SimpleOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructOnceMore {
    st: SimpleOptional;
    init() {
        self.st = SimpleOptional{ a: 1, b: null, s: "hi" };
    }
}