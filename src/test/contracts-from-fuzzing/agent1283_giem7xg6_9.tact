struct Nest {
    alpha: Int as uint32;
    beta: Bool?;
}

struct Container {
    n: Nest;
    x: Int;
}

contract OptSerNest {
    y: Container;

    init() {
        self.y = Container{
            n: Nest{
                alpha: 4294967295,
                beta: null,
            },
            x: 10,
        };
    }
}