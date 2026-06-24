struct OptMix {
    s: String?;
    sl: Slice?;
}

contract TestContract {
    om: OptMix;

    init() {
        self.om = OptMix {
            s: "hello", 
            sl: null,
        };
    }
}