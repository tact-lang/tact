struct MixOptional {
    a: Bool?;
    b: Int;
    c: String?;
    d: Address;
}

contract OptionalsMix {
    m: MixOptional;

    init() {
        self.m = MixOptional{
            a: null,
            b: 123,
            c: null,
            d: myAddress()
        };
    }
}