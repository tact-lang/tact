struct Inner {
    x: Int;
    y: String;
}

struct Container {
    i1: Inner;
    i2: Inner;
    i3: Inner;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            i1: Inner{ x: 1, y: "a" },
            i2: Inner{ x: 2, y: "b" },
            i3: Inner{ x: 3, y: "c" }
        };
    }
}