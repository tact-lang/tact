struct InnerDeep {
    val: String;
}

struct MidDeep {
    inn: InnerDeep;
}

struct OuterDeep {
    mid: MidDeep;
}

contract DeepStringStorage {
    nested: OuterDeep;

    init() {
        self.nested = OuterDeep{
            mid: MidDeep{
                inn: InnerDeep{
                    val: "zz"
                }
            }
        };
    }
}