struct MixedOpts {
    s: Slice?;
    n: Int?;
    b: Bool?;
}

contract OptSlices {
    state: MixedOpts;

    init() {
        self.state = MixedOpts{
            s: null,
            n: null,
            b: null,
        };
    }
}
