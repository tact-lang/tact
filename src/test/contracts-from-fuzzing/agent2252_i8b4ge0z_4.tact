struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    inn: Inner;
    x: Int?;
}

contract OptionNest {
    field: Outer;
    init() {
        self.field = Outer{
            inn: Inner{
                a: 10,
                b: null,
                c: true,
            },
            x: null,
        };
    }
}