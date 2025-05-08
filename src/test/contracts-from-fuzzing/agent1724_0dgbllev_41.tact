struct DataStruct {
    foo: Int;
    bar: Bool;
}

contract WeirdOrdering {
    b: DataStruct;
    a: Int;

    init() {
        self.b = DataStruct{ foo: 1, bar: true };
        self.a = 42;
    }
}