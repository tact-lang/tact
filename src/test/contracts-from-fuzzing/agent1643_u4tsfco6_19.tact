contract EmptyOptionalStruct {
    optStruct: Empty?;

    init() {
        self.optStruct = null;
    }
}

struct Empty {
    a: Int;
}