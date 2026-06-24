struct D {
    foo: Int?;
    bar: Bool?;
}

contract OptionalInStruct {
    field: D;

    init() {
        self.field = D{foo:null, bar:null};
    }

    receive() {
        self.field.foo = 99;
        self.field.bar = true;
    }
}