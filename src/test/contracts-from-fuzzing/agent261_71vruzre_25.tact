struct ManyOptions {
    n1: Int?; n2: Int?; n3: Int?; n4: Int?;
    f1: Bool?; f2: Bool?; f3: Bool?;
    s1: String?; s2: String?;
}

contract OptionalFieldsFlood {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions {
            n1: 1, n2: null, n3: null, n4: 4,
            f1: true, f2: null, f3: false,
            s1: null, s2: "hey"
        };
    }

    receive() {
        let _ = self.opts.n1;
    }
}