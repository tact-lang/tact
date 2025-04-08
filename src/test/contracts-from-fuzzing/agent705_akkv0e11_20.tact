struct OptSlices {
    s1: Slice?;
    s2: Slice?;
    s3: Slice?;
}

contract OptionalSlices {
    data: OptSlices;

    init() {
        self.data = OptSlices{ s1:null, s2:null, s3:null };
    }
}