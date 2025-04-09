struct OptStruct {
    foo: Int?;
}

contract InitDefaults {
    nested: OptStruct;

    init() {
        self.nested = OptStruct{foo:null};
    }
}