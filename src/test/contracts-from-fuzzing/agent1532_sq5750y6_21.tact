struct OptNest {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Container {
    inner1: OptNest;
    inner2: OptNest;
}

contract OptMultiNest {
    data: Container;

    init() {
        self.data = Container{
            inner1: OptNest{ a: null, b: null, c: true },
            inner2: OptNest{ a: 42, b: "x", c: null },
        };
    }
}