struct Inner {
    f1: Int;
    f2: Bool;
}

struct Container {
    optInner: Inner?;
    number: Int;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            optInner: null,
            number: 55
        };
    }
}