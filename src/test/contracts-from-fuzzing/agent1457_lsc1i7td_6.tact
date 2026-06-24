struct Deep2 {
    v: Int;
}

struct Deep1 {
    v: Int;
    inner: Deep2;
}

struct Top {
    a: Int;
    nested: Deep1;
}

contract MultiLevelDeep {
    d: Top;

    init() {
        self.d = Top{
            a: 7,
            nested: Deep1{
                v: 8,
                inner: Deep2 {
                    v: 9
                }
            }
        };
    }
}
