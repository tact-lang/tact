struct InnerMost {
    bit: Bool;
    value: Int;
}

struct Middle {
    nested: InnerMost;
    optionalNumber: Int?;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract DeepNestedStructStorage {
    info: Outer;

    init() {
        self.info = Outer{
            mid: Middle{
                nested: InnerMost{
                    bit: true,
                    value: 7
                },
                optionalNumber: null
            },
            flag: false
        };
    }
}