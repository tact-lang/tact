struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}