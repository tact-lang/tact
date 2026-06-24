struct OptionalDeep {
    inner: Int?;
}

struct OuterOpt {
    nested: OptionalDeep?;
}

contract Test {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            nested: null,
        };
    }
}