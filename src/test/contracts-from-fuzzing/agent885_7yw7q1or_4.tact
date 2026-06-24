struct OptRec {
    foo: Int?;
    bar: Bool?;
}

contract TestOpt {
    optfield: OptRec;

    init() {
        self.optfield = OptRec{ foo: null, bar: true };
    }
}
