contract InitWithStruct {
    data: DataStruct;

    init() {
        self.data = DataStruct{
            field1: 1,
            field2: "abc",
            optfield: null
        };
    }
}

struct DataStruct {
    field1: Int;
    field2: String;
    optfield: Bool?;
}
