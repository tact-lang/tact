struct DefaultsOptMix {
    a: Int = 5;
    b: Int?;
    c: Bool = true;
    d: Bool?;
}

contract MixInit {
    s: DefaultsOptMix;

    init() {
        self.s = DefaultsOptMix{
            b: null,
            d: null,
        };
    }
}