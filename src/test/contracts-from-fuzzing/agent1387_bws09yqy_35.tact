struct MixedOpts {
    o1: Int?;
    o2: Bool?;
    v1: Int;
    v2: Bool;
}

contract NestedOptMix {
    data: MixedOpts;

    init() {
        self.data = MixedOpts{
            o1: null, o2: true, v1: 77, v2: false
        };
    }
}