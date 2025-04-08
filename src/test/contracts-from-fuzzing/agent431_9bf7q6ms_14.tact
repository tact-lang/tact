struct OptWrap {
    a: Int?;
}

contract OptionalDirectField {
    wrap: OptWrap?;

    init() {
        self.wrap = null;
    }
}
