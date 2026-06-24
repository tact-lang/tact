struct DeepOptional {
    fld: Int?;
}

struct MiddleOptional {
    nested: DeepOptional?;
}

contract TopOptionalLayer {
    rec: MiddleOptional;

    init() {
        self.rec = MiddleOptional{
            nested: DeepOptional{
                fld: 77
            }
        };
    }
}