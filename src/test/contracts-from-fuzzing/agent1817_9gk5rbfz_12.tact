struct Inner {
    val: Int;
}

contract OptionalPrimitiveField {
    optVal: Int?;
    optStruct: Inner?;

    init() {
        self.optVal = null;
        self.optStruct = null;
    }
}
