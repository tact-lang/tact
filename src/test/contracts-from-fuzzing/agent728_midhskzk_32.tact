struct OptSlices {
    s1: Slice?;
    t1: String?;
    s2: Slice?;
    t2: String?;
}

contract OptMix {
    d: OptSlices;

    init() {
        self.d = OptSlices{
            s1: null,
            t1: null,
            s2: null,
            t2: null
        };
    }
}