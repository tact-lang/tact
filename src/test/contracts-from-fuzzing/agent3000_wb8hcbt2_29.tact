struct Strange {
    opt1: Int?;
    plain: String;
    opt2: Bool?;
    more: Int;
}

contract Test29 {
    s: Strange;

    init() {
        self.s = Strange{
            opt1: null,
            plain: "hi",
            opt2: true,
            more: 42,
        };
    }
}
