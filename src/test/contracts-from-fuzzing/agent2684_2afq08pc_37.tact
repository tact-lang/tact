contract BoolOptMix {
    b1: Bool?;
    b2: Bool = false;

    init() {
        self.b1 = true;
        self.b2 = true;
    }
}
