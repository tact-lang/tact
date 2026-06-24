struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalFields {
    stuff: OptStruct;

    init() {
        self.stuff = OptStruct{foo: null, bar: null, baz: null};
    }

    receive() {
        self.stuff.foo = 123;
        self.stuff.bar = true;
        self.stuff.baz = "text";
    }
}