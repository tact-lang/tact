struct OptionalStruct {
    a: Int;
}

struct Container {
    inner: OptionalStruct?;
}

contract TestContract {
    param: Container;

    init() {
        self.param = Container{
            inner: null,
        };
    }
}