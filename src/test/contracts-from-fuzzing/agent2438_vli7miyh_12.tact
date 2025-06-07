contract OptionalInit {
    intOpt: Int?;
    boolOpt: Bool?;

    init() {
        self.intOpt = 42;
        self.boolOpt = true;
    }
}
