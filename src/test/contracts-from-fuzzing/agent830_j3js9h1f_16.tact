struct ComplexStruct {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    nested: Nested;
}

struct Nested {
    foo: Int as uint8;
    bar: Bool?;
}

contract TestComplex {
    storage: ComplexStruct;
    
    init() {
        self.storage = ComplexStruct{
            i: 10,
            b: true,
            s: "data",
            o: null,
            nested: Nested{ foo: 7, bar: false }
        };
    }
}