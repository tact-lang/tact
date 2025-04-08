struct VeryDeep {
    nested: DeepNested;
    z: Int;
}

struct DeepNested {
    flag: Bool;
    inner: Inner;
}

struct Inner {
    value: Int;
    textOpt: String?;
}

contract TestVeryDeep {
    vd: VeryDeep;

    init() {
        self.vd = VeryDeep{
            nested: DeepNested{
                flag: true,
                inner: Inner{
                    value: 1,
                    textOpt: "deep"
                }
            },
            z: 5
        };
    }
}
