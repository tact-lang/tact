struct OptNest {
    a: Int?;
    b: Bool?;
    c: NestedOpt?;
}

struct NestedOpt {
    x: String?;
    y: Address?;
}

contract OptNested {
    data: OptNest;

    init() {
        self.data = OptNest{
            a: null,
            b: null,
            c: NestedOpt{
                x: "hello",
                y: null,
            },
        };
    }
}