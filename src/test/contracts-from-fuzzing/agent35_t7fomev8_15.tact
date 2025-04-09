// testing optional nested inside composite struct within contract storage
struct Inner {
    a: Int;
    b: Bool;
}

struct Container {
    nested: Inner?;
    x: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
            x: 100,
        };
    }
}
