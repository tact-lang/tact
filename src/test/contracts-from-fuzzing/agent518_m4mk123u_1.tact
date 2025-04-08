struct InnerStruct {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            a: 5,
            b: "Hello",
            c: true,
        };
    }
}