struct OptMix {
    a: Int?;
    b: Bool? = null;
    c: String?;
    d: Address? = null;
}

contract CMix {
    val: OptMix;

    init() {
        self.val = OptMix{
            a: null,
            c: null
        };
    }
}