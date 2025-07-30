struct Nested {
    z1: Int;
    z2: Bool?;
}

struct Middle {
    y1: Nested;
    y2: Nested?;
}

struct Deep {
    x1: Middle;
    x2: Middle?;
}

contract DeepNestedStorage {
    deeps: Deep;
    
    init() {
        self.deeps = Deep{
            x1: Middle{
                y1: Nested{ z1: 3, z2: true },
                y2: null
            },
            x2: null
        };
    }
}