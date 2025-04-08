struct OptStruct {
    foo: Int;
    bar: Int?;
    baz: Int?;
    qux: Int?;
}

contract TestContract {
    persist: OptStruct;
    init() {
        self.persist = OptStruct{
            foo: 123,
            bar: null,
            baz: 456,
            qux: null,
        };
    }
}
