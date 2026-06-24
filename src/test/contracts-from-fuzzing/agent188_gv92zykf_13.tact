contract OptionalStruct {
    data: DataStruct?;
    init() {
        self.data = DataStruct{
            a:1,
            b:true
        };
    }
}

struct DataStruct {
    a: Int;
    b: Bool;
}
