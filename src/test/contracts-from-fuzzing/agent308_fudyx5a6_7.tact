struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract OptStruct {
    content: OptionalStruct;

    init() {
        self.content = OptionalStruct{
            inner: null,
        };
    }
}
