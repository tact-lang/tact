struct Inner {
    val: Int;
}

struct Container {
    nested: Inner? = null;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{};
    }
}
