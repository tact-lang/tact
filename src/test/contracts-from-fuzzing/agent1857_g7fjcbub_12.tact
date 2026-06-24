struct DefOptMix {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hi";
    f: String?;
}

contract DefOptMixTest {
    val: DefOptMix;

    init() {
        self.val = DefOptMix{
            b: null, d: null, f: null
        };
    }
}