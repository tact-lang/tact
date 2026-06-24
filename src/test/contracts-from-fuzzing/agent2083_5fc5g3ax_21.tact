struct SOpt {
    maybe: Int?;
}

contract OptFieldStruct {
    s: SOpt?;

    init() {
        self.s = null;
    }
}
