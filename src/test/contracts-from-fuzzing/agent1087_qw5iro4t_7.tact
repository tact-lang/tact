struct Inner {
    x: Int;
    y: Int;
}

struct Container {
    point1: Inner?;
    point2: Inner?;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            point1: null,
            point2: Inner{
                x: 100,
                y: 200,
            },
        };
    }

    receive() {}
}