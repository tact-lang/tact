struct DeepOptional {
    value: Int;
}

struct Container {
    inner: DeepOptional?;
}

contract TestContract {
    stored: Container;

    init() {
        self.stored = Container{
            inner: null
        };
    }
}