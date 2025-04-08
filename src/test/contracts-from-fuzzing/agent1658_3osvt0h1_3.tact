struct OptStruct {
    foo: Int;
    bar: String?;
}

contract HasOptionalStruct {
    item: OptStruct;

    init() {
        self.item = OptStruct{
            foo: 5,
            bar: null
        };
    }
}