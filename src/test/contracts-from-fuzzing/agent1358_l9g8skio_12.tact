struct PartDefaults {
    a: Int as uint16;
    b: Bool = true;
    c: String?;
}

contract PartialInit {
    data: PartDefaults;

    init() {
        self.data = PartDefaults {
            a: 42,
            // b keeps default
            c: null
        };
    }
}