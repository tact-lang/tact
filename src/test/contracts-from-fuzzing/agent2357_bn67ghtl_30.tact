struct Variant {
    x: Int;
    y: Bool?;
}

contract DefaultAfterOptional {
    v: Variant = Variant{ x: 123, y: null };

    init() {
        self.v = Variant{ x: 5, y: null };
    }
}
