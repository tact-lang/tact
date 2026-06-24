struct OptionalSliceStruct {
    s: Slice?;
}

contract OptSliceStructTest {
    val: OptionalSliceStruct?;
    init() {
        self.val = null;
    }
}