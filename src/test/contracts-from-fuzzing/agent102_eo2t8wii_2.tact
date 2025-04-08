struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructTest {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{a: 10, b: false, c: "abc"};
    }
}