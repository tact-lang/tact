struct Child {
    data: Int = 42;
}

struct Container {
    maybeChild: Child?;
}

contract OptComposite {
    cont: Container;

    init() {
        self.cont = Container{ maybeChild: null };
    }
}
