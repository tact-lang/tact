// optional chain with defaulted nested
struct Final {
    z: Int = 9;
}

struct MidOpt {
    nested: Final?;
}

struct First {
    mid: MidOpt?;
}

contract OptChainWithDefault {
    data: First;

    init() {
        self.data = First{
            mid: MidOpt{
                nested: Final{}
            }
        };
    }
}
