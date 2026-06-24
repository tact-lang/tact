struct InnerOptionals {
    i: Int?;
    b: Bool?;
}

contract LayeredOptional {
    s: InnerOptionals?;
    init() {
        self.s = null;
    }
}
