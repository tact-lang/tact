struct Nested {
    foo: Int;
    bar: Bool;
}

struct Container {
    x: Int;
    y: Nested?;
    trail: Slice as remaining;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            x: 42,
            y: Nested{ foo: 1, bar: true },
            trail: emptyCell().asSlice()
        };
    }
}