struct InnerStruct {
    foo: Int;
    bar: Bool;
    text: String?;
}

contract TestContract {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            foo: -42,
            bar: true,
            text: null,
        };
    }
}