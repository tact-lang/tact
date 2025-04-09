struct OptStruct {
    foo: Int?;
    bar: Address?;
    baz: Bool;
}

contract OptStructContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{foo: null, bar: null, baz: true};
    }
}