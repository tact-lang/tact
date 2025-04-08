struct DeepOpt {
    inner: Int?;
}

struct MidOpt {
    nested: DeepOpt?;
}

contract OptionalDeep {
    data: MidOpt?;

    init() {
        self.data = MidOpt{
            nested: DeepOpt{
                inner: null
            }
        };
    }
}