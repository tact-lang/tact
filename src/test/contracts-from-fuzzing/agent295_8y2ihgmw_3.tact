struct Inner {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract OptionalStruct {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}