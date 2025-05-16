struct DataStruct {
    q: Int;
    t: Bool;
}

contract OptStructField {
    data: DataStruct?;

    init() {
        self.data = null;
    }
}