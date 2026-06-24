struct InnerOptSB {
    valStr: String?;
    valBool: Bool?;
}

struct MidOptSB {
    nested: InnerOptSB?;
}

contract DeepOptionalStringsBools {
    data: MidOptSB;

    init() {
        self.data = MidOptSB{
            nested: InnerOptSB{
                valStr: null,
                valBool: false
            }
        };
    }
}