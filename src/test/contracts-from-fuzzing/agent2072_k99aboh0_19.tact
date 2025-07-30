struct SliceOptionalTest {
    s1: Slice?;
    s2: Slice?;
}

contract OptSliceStorage {
    val: SliceOptionalTest;

    init() {
        self.val = SliceOptionalTest{
            s1: null,
            s2: null,
        };
    }
}