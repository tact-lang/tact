struct Sub {
    i: Int = 7;
}

struct Container {
    s: Sub?;
}

contract ImplicitNullContainer {
    data: Container;

    init() {
        self.data = Container{};
    }
}