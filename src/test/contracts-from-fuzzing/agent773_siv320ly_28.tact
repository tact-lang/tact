struct MixOpts {
    one: Int?;
    two: String?;
    three: Address?;
}

contract NestedOptMix {
    data: MixOpts;

    init() {
        self.data = MixOpts{
            one: null,
            two: null,
            three: null,
        };
    }
}