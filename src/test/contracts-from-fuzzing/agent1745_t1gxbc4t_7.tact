struct InnerMost { val: Int; }

struct InnerOpt {
    nested: InnerMost?;
}

contract OptionalDeep {
    stored: InnerOpt;

    init() {
        self.stored = InnerOpt{
            nested: null
        };
    }
}