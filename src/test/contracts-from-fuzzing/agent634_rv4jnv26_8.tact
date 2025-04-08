struct OptionalDeepLevel {
    num: Int?;
    flag: Bool?;
}

struct OptionalMidLevel {
    level: OptionalDeepLevel?;
    other: Int;
}

contract OptionalLayeredContract {
    layer: OptionalMidLevel;

    init() {
        self.layer = OptionalMidLevel{level: null, other: 7};
    }
}