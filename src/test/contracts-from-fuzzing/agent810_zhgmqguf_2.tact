struct InnerStruct {
    i1: Int;
    b1: Bool;
    s1: String;
}

contract TestContract {
    inner: InnerStruct;
    init() {
        self.inner = InnerStruct{
            i1: 1,
            b1: false,
            s1: "hi",
        };
    }
}