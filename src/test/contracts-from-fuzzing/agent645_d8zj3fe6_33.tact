struct Sharp {
    s: String;
    n: Int;
    b: Bool;
}

contract DifferentTypes {
    sf: Sharp;

    init() {
        self.sf = Sharp{
            s: "name",
            n: 42,
            b: true
        };
    }
}
