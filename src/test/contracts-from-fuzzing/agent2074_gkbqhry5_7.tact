struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalStructFields {
    s: Opts = Opts{ a: null, b: "X", c: null };

    receive() {
        self.s;
    }
}