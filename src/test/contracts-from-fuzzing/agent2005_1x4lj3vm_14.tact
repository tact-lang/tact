struct OptNested {
    sub1: NestedOptional?;
    sub2: DeeperNested?;
}

struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct DeeperNested {
    s1: NestedOptional;
    flag: Bool;
}

contract NullablesDeep {
    big: OptNested;

    init() {
        self.big = OptNested{
            sub1: null,
            sub2: null,
        };
    }
}