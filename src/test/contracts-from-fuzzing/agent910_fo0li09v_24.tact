struct SOpt {
    x: Int?;
}

contract OptionalInit {
    s: SOpt;

    init() {
        self.s = SOpt{
            x: null
        };
    }
}
