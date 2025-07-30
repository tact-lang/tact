struct Innermost {
    n: Int?;
}

struct Mid {
    i: Innermost?;
}

struct Out {
    m: Mid?;
}

contract MultiLayerNestedOpt {
    val: Out;

    init() {
        self.val = Out{
            m: Mid{
                i: Innermost{
                    n: 5,
                },
            },
        };
    }
}
