struct OptionalDeep {
    nested: Deep?;
}

struct Deep {
    nested: Deeper;
}

struct Deeper {
    val: Int;
}

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            nested: Deep{
                nested: Deeper{
                    val: 99,
                },
            },
        };
    }
}