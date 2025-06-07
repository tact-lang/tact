struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
}
contract DefaultStructOptional {
    s: WithDefaults?;
    init() {
        self.s = null;
    }
}
