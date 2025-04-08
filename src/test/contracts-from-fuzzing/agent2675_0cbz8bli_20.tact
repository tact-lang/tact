struct Sub {
    i: Int = 7;
}

struct Container {
    s: Sub?;
}

contract ExplicitNullContainer {
    data: Container;

    init() {
        self.data = Container{
            s: null
        };
    }
}