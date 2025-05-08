struct StructMix {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract StructMixTest {
    val: StructMix;
    init() {
        self.val = StructMix{
            a: 1,
            b: "s",
            c: true,
            d: null,
            e: null,
            f: false,
        };
    }
}