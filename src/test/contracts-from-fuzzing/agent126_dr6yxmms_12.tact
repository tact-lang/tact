struct OptStruct {
    val: Int?;
}

contract OptionalStructField {
    maybe: OptStruct?;

    init() {
        self.maybe = OptStruct{
            val: null
        };
    }
}