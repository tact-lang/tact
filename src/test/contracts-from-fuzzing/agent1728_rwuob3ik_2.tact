struct InnerStruct {
    bar: Int = 1;
    baz: Bool = true;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{};
    }
}