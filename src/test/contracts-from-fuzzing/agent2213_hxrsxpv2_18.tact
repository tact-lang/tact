struct SDeep {
    nested: SNested;
}

struct SNested {
    value: Int;
}

contract OptAround {
    innerOpt: SDeep?;

    init() {
        self.innerOpt = SDeep{
            nested: SNested{
                value: 314,
            },
        };
    }
}
