struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract OptNested {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            a: null,
            b: null,
            c: InnerOpt{
                x: 10,
                y: true
            }
        };
    }
}
