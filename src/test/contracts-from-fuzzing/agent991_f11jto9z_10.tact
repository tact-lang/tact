struct Child {
    score: Int;
}

contract OptStructImplicitNull {
    ch: Child?;

    init() {
        self.ch = null;
    }
}