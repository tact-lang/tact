struct OptionalWrap {
    content: Int?;
}

struct Container {
    wrapper: OptionalWrap;
    regular: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            wrapper: OptionalWrap{ content: null },
            regular: 9
        };
    }
}