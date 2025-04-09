struct OptNested {
    foo: Int;
    bar: Bool;
}

struct Container {
    nested: OptNested?;
    text: String;
}

contract OptionInsideStruct {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
            text: "hello"
        };
    }
}
