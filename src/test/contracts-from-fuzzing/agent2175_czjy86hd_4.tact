struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
    optInt: Int?;
}

contract OptionalNestedStruct {
    optData: Inner?;

    init() {
        self.optData = Inner{ val1: 7, val2: false, val3: "hi", optInt: null };
    }
}