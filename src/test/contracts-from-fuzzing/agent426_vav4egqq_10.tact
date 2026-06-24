struct SOpt {
    a: Int?;
}

struct Container {
    inner: SOpt;
    innerOpt: SOpt?;
}

contract TestContract {
    composite: Container;

    init() {
        self.composite = Container{
            inner: SOpt{ a: 5 },
            innerOpt: null,
        };
    }
}