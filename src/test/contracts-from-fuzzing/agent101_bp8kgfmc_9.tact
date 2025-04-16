struct InnerX {
    x: Int;
    y: Bool;
    s: String;
    f: Int?;
    t: Bool?;
    u: String?;
}

struct OuterX {
    inner: InnerX;
    q: Int;
}

contract TwoNest {
    field: OuterX = OuterX{
        inner: InnerX{
            x: 1,
            y: false,
            s: "s",
            f: null,
            t: true,
            u: null,
        },
        q: 42,
    };

    init() {
        self.field = OuterX{
            inner: InnerX{
                x: 10,
                y: true,
                s: "str",
                f: 20,
                t: false,
                u: "nonull",
            },
            q: 99,
        };
    }
}