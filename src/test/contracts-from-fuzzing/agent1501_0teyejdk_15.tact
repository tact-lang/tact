struct InnerMost {
    z: Int;
}

struct MidOptional {
    y: InnerMost?;
}

struct OuterOpt {
    x: MidOptional?;
}

contract NestedOptionals {
    layered: OuterOpt;

    init() {
        self.layered = OuterOpt {
            x: MidOptional {
                y: InnerMost { z: 888 }
            }
        };
    }
}