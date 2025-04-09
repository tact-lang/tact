struct OptStruct {
    a: Int;
    b: Bool?;
}

contract OptStructField {
    field: OptStruct?;

    init() {
        self.field = OptStruct{
            a: 5,
            b: null
        };
    }
}