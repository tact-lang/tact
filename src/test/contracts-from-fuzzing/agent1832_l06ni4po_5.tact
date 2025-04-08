struct DataStruct {
    i1: Int;
    s1: String;
    b1: Bool;
}

contract MixedPrimitiveStruct {
    st: DataStruct;

    init() {
        self.st = DataStruct{
            i1: 5,
            s1: "abc",
            b1: true
        };
    }
}
