struct InnerMost { val: Int }

struct InnerOpt {
    x: Int?;
    y: InnerMost?;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool?;
}

contract OptNested {
    data: OuterOpt;
    init() {
        self.data = OuterOpt {
            inner: InnerOpt {
                x: null,
                y: null,
            },
            flag: true,
        };
    }
}