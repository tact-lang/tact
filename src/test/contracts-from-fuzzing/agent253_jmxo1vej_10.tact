struct InnerOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct OuterOpt {
    x: InnerOpt?;
    y: String;
    z: Bool;
}

contract OptionalNesting {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            x: InnerOpt{ a: null, b: "yes", c: true },
            y: "outer",
            z: false
        };
    }
}