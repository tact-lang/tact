struct NullableDepth {
    f1: Int?;
    f2: SNext?;
}

struct SNext {
    val: Int?;
    flag: Bool?;
}

contract OptionalLayers {
    nested: NullableDepth;

    init() {
        self.nested = NullableDepth{
            f1: 1,
            f2: SNext{
                val: null,
                flag: true
            }
        };
    }
}