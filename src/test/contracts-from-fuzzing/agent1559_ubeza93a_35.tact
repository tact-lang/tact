struct OptionalSliceStruct {
    s: Slice?;
}

contract OptionalSliceTest {
    val: OptionalSliceStruct;

    init() {
        self.val = OptionalSliceStruct{ s: null };
    }
}