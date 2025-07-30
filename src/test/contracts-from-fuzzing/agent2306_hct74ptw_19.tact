struct Variant {
    a: Int?;
    b: Bool;
}

contract OptBeforeNonOpt {
    variant: Variant;

    init() {
        self.variant = Variant {
            a: null,
            b: true
        };
    }
}
