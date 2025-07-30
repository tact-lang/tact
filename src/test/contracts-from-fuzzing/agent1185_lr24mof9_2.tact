struct OptionalInner {
    a: Int;
    b: Bool;
}

struct Container {
    optInner: OptionalInner?;
}

contract TestPersistentOptional {
    param: Container;

    init() {
        self.param = Container{optInner: null};
    }
}