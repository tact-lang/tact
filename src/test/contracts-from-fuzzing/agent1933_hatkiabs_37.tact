struct Inner {
    deep: String;
}

struct Container {
    first: Inner;
    second: Inner;
}

contract NestedMany {
    c: Container;

    init() {
        self.c = Container{
            first: Inner{ deep: "a" },
            second: Inner{ deep: "b" },
        };
    }
}