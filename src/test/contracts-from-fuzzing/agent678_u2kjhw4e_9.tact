struct OptionalFieldStruct {
    val: Int?;
}

contract TestContract {
    optField: OptionalFieldStruct;
    init() {
        self.optField = OptionalFieldStruct{ val: null };
    }
}