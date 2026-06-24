struct NestedSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract ManySlices {
    val: NestedSlices;
    init() {
        let c = emptyCell().asSlice();
        self.val = NestedSlices{ s1:c, s2:c, s3:c };
    }
}