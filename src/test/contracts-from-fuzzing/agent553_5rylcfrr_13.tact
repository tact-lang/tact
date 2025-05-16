struct OptionalInt {
    val: Int?;
}

contract OptionalStruct {
    inner: OptionalInt;

    init() {
        self.inner = OptionalInt{ val: null };
    }
}