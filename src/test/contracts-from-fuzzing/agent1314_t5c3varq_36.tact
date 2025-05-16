struct RevOrder {
    s: String?;
    b: Bool;
    i: Int;
}

contract OrderFields {
    rev: RevOrder;

    init() {
        self.rev = RevOrder {
            s: null,
            b: true,
            i: 42,
        };
    }
}