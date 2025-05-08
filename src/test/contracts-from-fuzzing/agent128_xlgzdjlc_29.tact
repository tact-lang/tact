struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: Int;
    d: Bool;
}

contract TestContract {
    f: OptionalMix;

    init() {
        self.f = OptionalMix{
            a: null,
            b: true,
            c: 55,
            d: false
        };
    }
}