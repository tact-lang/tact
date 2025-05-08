struct DeepMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract DeepMixStructPersist {
    rec: DeepMix;

    init() {
        self.rec = DeepMix{
            a: 1, b: null, c: true, d: null, e: "hi", f: null, g: myAddress(), h: null
        };
    }
}