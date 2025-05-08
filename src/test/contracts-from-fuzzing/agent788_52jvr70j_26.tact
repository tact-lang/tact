struct SOpt {
    foo: Int?;
}

contract InlineStructOpt {
    s: SOpt?;

    init() {
        self.s = null;
    }
}