struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    a: Int;
    b: InnerOpt;
    c: String?;
}

contract DeepOptionals {
    nested: OuterOpt;

    init() {
        self.nested = OuterOpt{
            a: 5,
            b: InnerOpt{ x: 7, y: null },
            c: "ok"
        };
    }
}