struct OptionalDeep {
    a: Int?;
    b: Bool?;
    nest: InnerOptional?;
}

struct InnerOptional {
    c: Int?;
    d: Bool?;
}

contract OptionalLayers {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            a: 1,
            b: null,
            nest: InnerOptional{
                c: null,
                d: true
            }
        };
    }
}
