struct LargeOptionalNested {
    a: Int?;
    b: Bool?;
    c: Medium?
}

struct Medium {
    d: String?;
    e: Int?;
    f: Small?;
}

struct Small {
    g: Int;
    h: Bool?;
}

contract TestContract {
    data: LargeOptionalNested;

    init() {
        self.data = LargeOptionalNested{
            a: null,
            b: true,
            c: Medium{
                d: "abc",
                e: null,
                f: Small{
                    g: 42,
                    h: null
                }
            }
        };
    }
}