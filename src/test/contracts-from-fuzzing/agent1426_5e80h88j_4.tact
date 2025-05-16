struct OptDeep {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner1: OptDeep?;
    inner2: OptDeep?;
}

contract TestContainer {
    s: Container;

    init() {
        self.s = Container{
            inner1: null,
            inner2: OptDeep{ a: 1, b: null },
        };
    }
}