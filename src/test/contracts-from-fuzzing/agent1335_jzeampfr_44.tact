struct SOptOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalStructFields {
    s: SOptOpt?;

    init() {
        self.s = null;
    }
}