struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFieldsContract {
    state: OptionalStruct;
    
    init() {
        self.state = OptionalStruct{
            foo: null,
            bar: null,
            baz: null
        };
    }
}
