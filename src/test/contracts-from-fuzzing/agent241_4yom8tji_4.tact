struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalStructField {
    opt: HasOptionals = HasOptionals{ a: null, b: null, c: null };

    init() {
        self.opt = HasOptionals{ a: 1, b: true, c: null };
    }
}