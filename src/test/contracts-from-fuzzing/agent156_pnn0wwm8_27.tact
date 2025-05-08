struct SerAndPtrMix {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Int;
    e: Bool?;
}

contract SerPtrMixTest {
    f: SerAndPtrMix;
    init() {
        self.f = SerAndPtrMix{
            a: 1,
            b: true,
            c: "hi",
            d: 42,
            e: null
        };
    }
}
