struct OptionalNested {
    inner: Int?;
    s: String?;
}

contract OptNest {
    state: OptionalNested;
    init() {
        self.state = OptionalNested{ inner: null, s: null };
    }
}