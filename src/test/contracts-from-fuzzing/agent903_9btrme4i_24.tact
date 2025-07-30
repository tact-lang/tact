struct OptMix {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct WrapMix {
    inner: OptMix;
    flag: Bool;
}

contract OptionalMix {
    storage: WrapMix;

    init() {
        self.storage = WrapMix{
            inner: OptMix{foo:null, bar:true, baz:null},
            flag: false
        };
    }
}