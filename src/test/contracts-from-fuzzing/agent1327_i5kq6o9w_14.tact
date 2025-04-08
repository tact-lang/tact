struct OptionalStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalTop {
    top: OptionalStruct?;

    init() {
        self.top = null;
    }
}