struct DefaultOptFields {
    foo: Int?;    
    bar: Bool?;   
    baz: Address?;
}

contract DefaultOptionals {
    data: DefaultOptFields;

    init() {
        self.data = DefaultOptFields{
            foo: null,
            bar: null,
            baz: null
        };
    }
}
