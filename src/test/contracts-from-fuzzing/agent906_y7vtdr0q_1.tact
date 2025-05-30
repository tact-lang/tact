struct Inner {
    x: Int;
    y: Int?;
}

struct Container {
    nested: Inner;
    z: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: Inner{
                x: 1,
                y: null,
            },
            z: 2,
        };
    }
}