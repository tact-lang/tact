struct DeepMix {
    foo: Int;
    bar: NestedMix2;
}

struct NestedMix2 {
    baz: NestedMix3;
    opt: Int?;
}

struct NestedMix3 {
    flag: Bool;
    label: String?;
}

contract NestedMixDeep {
    dat: DeepMix;

    init() {
        self.dat = DeepMix{
            foo: 42,
            bar: NestedMix2{
                baz: NestedMix3{
                    flag: true,
                    label: "deep",
                },
                opt: 7,
            },
        };
    }
}
