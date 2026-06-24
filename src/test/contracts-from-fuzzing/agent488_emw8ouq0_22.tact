struct SerIntStruct {
    a: Int as int4;
    b: Int as uint12;
    c: Int;
}

contract PersistStructWithSerializedInts {
    foo: SerIntStruct;

    init() {
        self.foo = SerIntStruct{
            a: 7,
            b: 100,
            c: 10000
        };
    }
}