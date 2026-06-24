struct OptionalNested {
    inner: Int?;
}

struct Container {
    optStruct: OptionalNested?;
    regular: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            optStruct: null,
            regular: 5
        };
    }
}