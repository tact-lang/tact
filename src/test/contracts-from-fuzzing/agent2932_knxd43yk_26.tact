struct Container {
    opt: Int?;
    str: String;
}

contract OptionalContainer {
    data: Container;

    init() {
        self.data = Container{
            opt: null,
            str: "hello"
        };
    }
}