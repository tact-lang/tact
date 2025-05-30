struct Sub {
    field: Int = 5;
}

struct Container {
    s: Sub? = null;
}

contract DefaultNullNested {
    c: Container;

    init() {
        self.c = Container{};
    }
}
