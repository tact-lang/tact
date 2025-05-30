struct OptionalCont {
    a: Int?;
    b: Bool?;
}

contract OptOptOpt {
    f: OptionalCont?;
    init() {
        self.f = null;
    }
}