struct MultBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract BoolPacked {
    flags: MultBools;

    init() {
        self.flags = MultBools{
            a: true,
            b: false,
            c: true,
            d: false,
        };
    }
}