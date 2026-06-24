struct SOpt {
    foo: Int?;
}

contract DefaultsVsInit {
    x: Int = 5;
    y: Int;
    s: SOpt;

    init() {
        self.y = 10;
        self.s = SOpt{foo: null};
    }
}