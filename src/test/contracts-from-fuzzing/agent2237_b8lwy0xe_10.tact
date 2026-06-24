struct OptionalStruct {
    maybeData: DataStruct?;
}

struct DataStruct {
    count: Int;
    flag: Bool;
}

contract OptionalStructField {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            maybeData: DataStruct {
                count: 999,
                flag: true
            }
        };
    }
}