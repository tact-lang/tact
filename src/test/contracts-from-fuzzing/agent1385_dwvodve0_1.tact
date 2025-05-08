struct InnerOptionalStruct {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: InnerOptionalStruct;

    init() {
        self.data = InnerOptionalStruct{
            foo: null,
            bar: null
        };
    }
}