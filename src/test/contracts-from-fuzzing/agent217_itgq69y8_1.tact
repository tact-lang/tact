struct InnerStruct { a: Int; b: Bool; }

contract TestContract {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{a: 123, b: true};
    }
}