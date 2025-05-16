struct Deep {
    level: Int;
    inner: InnerDeep;
}

struct InnerDeep {
    value: Int?;
    flag: Bool;
}

contract DeepNested {
    d: Deep;

    init() {
        self.d = Deep{
            level: 5,
            inner: InnerDeep{
                value: null,
                flag: false
            }
        };
    }
}
