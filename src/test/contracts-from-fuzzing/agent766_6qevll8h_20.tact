// test empty optional composite inside struct
struct Container {
    foo: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            foo: null
        };
    }
}