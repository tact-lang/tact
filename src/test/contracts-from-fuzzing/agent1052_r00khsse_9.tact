struct OptionalNested {
    a: Int?;
    b: String?;
    c: Bool?;
    d: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: String;
}

contract OptionalDeep {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}