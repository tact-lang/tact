struct InnerMost {
    value: Int;
    label: String;
}

struct MidLevel {
    inner: InnerMost;
    optionalInner: InnerMost?;
    flag: Bool;
}

struct Top {
    mid1: MidLevel;
    mid2: MidLevel;
}

contract PersistComplex {
    core: Top;

    init() {
        self.core = Top{
            mid1: MidLevel{
                inner: InnerMost{ value: 1, label:"a" },
                optionalInner: null,
                flag: true
            },
            mid2: MidLevel{
                inner: InnerMost{ value: 2, label:"b" },
                optionalInner: InnerMost{ value: 3, label:"c" },
                flag: false
            }
        };
    }
}