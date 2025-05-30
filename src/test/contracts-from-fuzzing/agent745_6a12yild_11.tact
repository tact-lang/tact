struct OptStruct {
    foo: Int;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = OptStruct{
            foo: 999
        };
    }
}