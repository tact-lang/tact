struct DataStruct {
    a: Int as int64;
    b: Bool;
    c: String;
}

contract TestContract {
    field1: Int = 1;
    field2: Bool = true;
    field3: String = "abc";
    nested: DataStruct;

    init() {
        self.nested = DataStruct{
            a: 1000,
            b: false,
            c: "xyz"
        };
    }
}
