struct NestOpt {
    a: Int?;
    b: Bool;
}

struct Container {
    inner: NestOpt?;
    label: String;
}

contract OptionalInNestedStruct {
    data: Container;

    init() {
        self.data = Container{
            inner: null,
            label: "test"
        };
    }
}