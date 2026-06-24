struct Deep {
    nested: Deeper;
}

struct Deeper {
    nested: EvenDeeper;
}

struct EvenDeeper {
    nested: Deepest;
}

struct Deepest {
    val: Int;
}

contract Depth {
    data: Deep;

    init() {
        self.data = Deep{
            nested: Deeper{
                nested: EvenDeeper{
                    nested: Deepest{
                        val: 42,
                    },
                },
            },
        };
    }
}