struct SOpt {
    x: Int;
    y: Int?;
    z: String?;
}

contract TestOpt {
    s: SOpt;

    init() {
        self.s = SOpt{
            x: 100,
        };
    }
}