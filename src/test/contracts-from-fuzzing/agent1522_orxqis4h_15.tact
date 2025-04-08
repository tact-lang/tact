struct InnerDeep {
    x: Int;
    y: Int;
}

struct MiddleDeep {
    a: InnerDeep;
    b: InnerDeep;
}

struct OuterDeep {
    left: MiddleDeep;
    right: MiddleDeep;
}

contract DoubleDeepStorage {
    all: OuterDeep;

    init() {
        self.all = OuterDeep{
            left: MiddleDeep{
                a: InnerDeep{ x: 1, y: 2 },
                b: InnerDeep{ x: 3, y: 4 },
            },
            right: MiddleDeep{
                a: InnerDeep{ x: 5, y: 6 },
                b: InnerDeep{ x: 7, y: 8 },
            },
        };
    }

    receive() {
        let _ = self.all;
    }
}