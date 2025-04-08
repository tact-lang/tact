contract OptStruct {
    data: DataOpt?;

    init() {
        self.data = null;
    }
}

struct DataOpt {
    foo: Int;
    bar: Bool;
}