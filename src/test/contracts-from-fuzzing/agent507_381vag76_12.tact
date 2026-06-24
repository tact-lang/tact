struct Inner {
    x: Int?;
    y: Bool?;
}

struct Container {
    f1: Inner?;
    f2: Inner;
    f3: Int;
}

contract TestContract {
    payload: Container;

    init() {
        self.payload = Container{
            f1: null,
            f2: Inner{x: null, y: null},
            f3: 7
        };
    }
}