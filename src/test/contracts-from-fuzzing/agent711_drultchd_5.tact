struct OptionalStruct {
    x: Int?;
}

struct Container {
    inner: OptionalStruct;
    y: Int?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: OptionalStruct{ x: null },
            y: null,
        };
    }
}