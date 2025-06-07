struct HasOptionalInside {
    foo: Int?;
    bar: Bool;
}

contract OptionalStructWithOther {
    s: HasOptionalInside;

    init() {
        self.s = HasOptionalInside{ foo: null, bar: true };
    }

    receive() {
        let _ = self.s;
    }
}