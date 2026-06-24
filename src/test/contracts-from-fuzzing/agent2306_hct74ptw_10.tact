struct OptionalNest {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalTop {
    top: OptionalNest?;

    init() {
        self.top = null;
    }
}
