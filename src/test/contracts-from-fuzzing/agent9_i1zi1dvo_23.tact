struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    x: Int;
    y: InnerOpt;
    z: Int?;
}

contract OptionalInsideOut {
    data: OuterOpt;

    init() {
        self.data = OuterOpt {
            x: 1,
            y: InnerOpt { a: null },
            z: null
        };
    }
}