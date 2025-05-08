struct SOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract ChainedOptionals {
    x: SOpt?;
    init() {
        self.x = null;
    }
}