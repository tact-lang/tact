struct DeepOpt {
    i: Int?;
    s: String?;
    b: Bool?;
}

struct OuterDeep {
    nested: DeepOpt?;
    label: String;
}

contract OptOnOpt {
    data: OuterDeep;
    init() {
        self.data = OuterDeep{
            nested: null,
            label: "x"
        };
    }
}