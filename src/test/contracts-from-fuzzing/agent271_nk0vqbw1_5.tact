struct WrappedOptional {
    val: Int?;
}

struct Container {
    wopt: WrappedOptional;
    b: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            wopt: WrappedOptional{ val: null },
            b: true
        };
    }
}