struct Chain {
    v1: Int?;
    v2: String?;
    v3: Bool?;
}

struct Container {
    c1: Chain;
    c2: Chain;
}

contract CompositeOptionals {
    x: Container;

    init() {
        self.x = Container{
            c1: Chain{
                v1: null,
                v2: null,
                v3: null
            },
            c2: Chain{
                v1: 1,
                v2: "abc",
                v3: true
            }
        };
    }
}