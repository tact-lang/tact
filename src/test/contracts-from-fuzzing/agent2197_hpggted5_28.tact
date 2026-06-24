struct SOpt {
    x: Int;
    y: Bool;
}

contract SFieldOpt {
    s: SOpt?;

    init() {
        self.s = null;
    }
}