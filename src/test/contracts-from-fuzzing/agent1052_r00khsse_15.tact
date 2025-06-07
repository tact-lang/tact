contract OnlyOptionalStruct {
    data: DataOpt?;

    init() {
        self.data = null;
    }
}

struct DataOpt {
    a: Int;
    b: Bool;
}