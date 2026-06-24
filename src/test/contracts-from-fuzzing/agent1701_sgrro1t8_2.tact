struct VeryDeep {
    one: Int;
    two: MidLevel;
}

struct MidLevel {
    three: LowerLevel;
    four: Int?;
}

struct LowerLevel {
    five: Int;
    six: Int?;
    seven: LeafLevel;
}

struct LeafLevel {
    eight: Int;
}

contract DeepNest {
    nested: VeryDeep;

    init() {
        self.nested = VeryDeep{
            one: 1,
            two: MidLevel{
                three: LowerLevel{
                    five: 5,
                    six: null,
                    seven: LeafLevel{
                        eight: 8
                    }
                },
                four: null
            }
        };
    }
}