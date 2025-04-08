struct OptionalStringMix {
    s: String?;
    b: Bool;
    n: Int;
}

contract OptStringMixTest {
    store: OptionalStringMix;

    init() {
        self.store = OptionalStringMix{
            s:null,
            b:true,
            n:5,
        };
    }
}