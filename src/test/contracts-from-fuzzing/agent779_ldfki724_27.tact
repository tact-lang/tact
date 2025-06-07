struct SuperNested {
    x1: Int;
    x2: Bool?;
    x3: Sub;
}

struct Sub {
    y1: Int;
    y2: Tiny;
}

struct Tiny {
    z1: Bool?;
    z2: Int?;
}

contract DeepMixedOptionals {
    data: SuperNested;

    init() {
        self.data = SuperNested{
            x1: 8,
            x2: null,
            x3: Sub{
                y1: 9,
                y2: Tiny{ z1: true, z2: null }
            }
        };
    }
}