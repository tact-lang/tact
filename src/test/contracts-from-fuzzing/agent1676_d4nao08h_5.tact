struct Combo {
    req: Int;
    opt: Bool?;
}

contract OptionalDefault {
    field: Combo;
    init() {
        self.field = Combo{
            req: 42,
            // opt omitted intentionally
        };
    }
}
