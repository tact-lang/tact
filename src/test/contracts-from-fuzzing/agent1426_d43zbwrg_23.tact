struct OptIntBool {
    a: Int?;
    b: Bool?;
}

contract OptMix {
    val: OptIntBool;

    init() {
        self.val = OptIntBool{
            a: null,
            b: null
        };
    }
}