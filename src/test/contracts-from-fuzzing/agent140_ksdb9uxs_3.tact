struct OptionalStruct {
    val: Int?;
}

contract WithOptionalStruct {
    inner: OptionalStruct;

    init() {
        self.inner = OptionalStruct{ val: null };
    }
}