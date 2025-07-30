struct Mix {
    a: Int as uint8;
    b: Bool;
    c: String?;
    d: Int as int16;
}

contract ComplexMix {
    x: Mix;

    init() {
        self.x = Mix{
            a: 5,
            b: true,
            c: null,
            d: -8
        };
    }
}
