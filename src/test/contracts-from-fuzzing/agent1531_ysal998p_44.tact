struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MixOptDefaults {
    foo: OptionalMix;
    bar: OptionalMix;

    init() {
        self.foo = OptionalMix{a:null,b:null,c:null,d:null};
        self.bar = OptionalMix{a:1,b:true,c:"s",d:myAddress()};
    }
}
