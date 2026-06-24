struct Strange {
    a: Bool?;
    b: String;
    c: Int;
    d: String?;
}

contract StrangeLayout {
    f: Strange;

    init() {
        self.f = Strange{
            a: true,
            b: "b",
            c: 5,
            d: null,
        };
    }
}