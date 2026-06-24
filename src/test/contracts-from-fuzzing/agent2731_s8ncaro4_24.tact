struct EmbedOpt {
    foo: Int?;
    bar: String?;
}

struct TopOpt {
    inner: EmbedOpt?;
    flag: Bool;
}

contract NestedOptionalLayer {
    opts: TopOpt;

    init() {
        self.opts = TopOpt{inner: null, flag: true};
    }
}