struct BooleanMix {
    a: Bool;
    b: Bool = true;
    c: Bool?;
    d: Bool? = null;
}

contract TestContract {
    s: BooleanMix;
    init() {
        self.s = BooleanMix{
            a: false,
            b: false,
            c: true,
            d: null
        };
    }
}