struct OptDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
}

struct Outer {
    od: OptDeep;
    e: String;
}

contract Test8 {
    field: Outer;

    init() {
        self.field = Outer{
            od: OptDeep{
                a: null,
                b: null,
                c: "hi",
                d: 42,
            },
            e: "outer",
        };
    }
}
