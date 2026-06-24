struct MixOpt {
    foo: Int;
    bar: String?;
}

contract PartialInitOptional {
    s: MixOpt?;

    init() {
        self.s = MixOpt{
            foo: 42,
            bar: null
        };
    }
}