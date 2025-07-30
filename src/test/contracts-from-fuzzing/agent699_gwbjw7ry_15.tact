struct Child {
    info: String = "hi";
}

struct Container {
    maybeChild: Child?;
}

contract OptCompositeSet {
    cont: Container;

    init() {
        self.cont = Container{ maybeChild: Child{} };
    }
}
