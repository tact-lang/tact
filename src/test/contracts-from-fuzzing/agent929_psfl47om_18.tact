struct MixedOptional {
    a: Int = 1;
    b: Bool?;
    c: String = "str";
    d: Address?;
}

contract MixedOptionalStruct {
    m: MixedOptional;

    init() {
        self.m = MixedOptional{
            b: true,
            d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }
}