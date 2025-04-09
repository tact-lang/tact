struct SliceMix {
    s1: Slice;
    s2: Slice?;
    s3: Slice;
    s4: Slice?;
}

contract SliceMixTest {
    val: SliceMix;

    init() {
        self.val = SliceMix{
            s1: emptyCell().asSlice(),
            s2: null,
            s3: emptyCell().asSlice(),
            s4: null
        };
    }
}