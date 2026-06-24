struct InnerOpt {
    s: String?;
    b: Bool?;
}

struct Container {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

contract OptionalNest {
    data: Container;

    init() {
        self.data = Container{
            inner1: null,
            inner2: null
        };
    }
}