contract StructWithManyMaps {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            a: emptyMap(),
            b: emptyMap(),
            c: emptyMap(),
            d: emptyMap(),
            e: 42
        };
    }
}

struct ComplexStruct {
    a: map<Int, Int>;
    b: map<Address, Int>;
    c: map<Int, Bool>;
    d: map<Address, Bool>;
    e: Int;
}