struct OptionalRefStruct {
    inner: OptionalInner?;
}

struct OptionalInner {
    val: Int;
}

contract OptionalStructField {
    value: OptionalRefStruct;

    init() {
        self.value = OptionalRefStruct{ inner: null };
    }
}