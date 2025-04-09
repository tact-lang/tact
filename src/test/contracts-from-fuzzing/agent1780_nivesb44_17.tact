struct HasSlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
}

contract ManySlices {
    val: HasSlices;

    init() {
        let e = emptyCell().asSlice();
        self.val = HasSlices{ s1:e, s2:e, s3:e };
    }
}