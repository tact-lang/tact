struct OptStruct {
    val: Int?;
    flag: Bool;
}

contract OptionalStructField {
    data: OptStruct;
    init() {
        self.data = OptStruct{ val: null, flag: true };
    }
}