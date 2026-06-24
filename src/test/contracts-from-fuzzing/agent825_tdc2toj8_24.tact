// struct with many optional defaults and non-defaults
struct OptMix {
    a: Int? = null;
    b: Bool?;
    c: String? = null;
    d: Int?;
}

contract OptMixTest {
    val: OptMix;

    init() {
        self.val = OptMix{
            b: null,
            d: null,
        };
    }
}