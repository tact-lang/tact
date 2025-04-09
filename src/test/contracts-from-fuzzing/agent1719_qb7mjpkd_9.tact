struct InnerMix {
    flag: Bool;
    comment: String?;
}

struct ComplexMix {
    count: Int;
    label: String;
    maybe: Int?;
    data: InnerMix;
}

contract MixedPersistent {
    state: ComplexMix;

    init() {
        self.state = ComplexMix{
            count: 5,
            label: "test",
            maybe: null,
            data: InnerMix{
                flag: true,
                comment: "done"
            }
        };
    }
}