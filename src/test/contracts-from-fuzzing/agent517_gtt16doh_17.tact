struct Mid {
    a: Int;
}

struct Container {
    m: Mid?;
}

contract OptionalMid {
    store: Container;
    init() {
        self.store = Container{
            m: null
        };
    }
}