struct Inner {
    a: Int? as int16;
    b: Bool?;
    c: String?;
    d: Int;
}

contract MixedOptionals {
    field: Inner;

    init() {
        self.field = Inner{
            a: null,
            b: null,
            c: null,
            d: 7
        };
    }
}